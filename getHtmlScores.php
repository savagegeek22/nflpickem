<?php
require('includes/application_top.php');

if ($_GET['execute'] != 1) {
    print "<a href=\"getHtmlScores.php?BATCH_SCORE_UPDATE_KEY=" . BATCH_SCORE_UPDATE_KEY . "&execute=1\">Execute?</a></br></br>";
} else {
    print "<a href=\"results.php\">Results</a></br></br>";
}

$week = (int)$_GET['week'];
if (empty($week)) {
    $week = (int)getCurrentWeek(); // get current week
}

// API URL returning JSON data
$url = "https://site.api.espn.com/apis/site/v2/sports/football/nfl/scoreboard?week=".$week;

echo $url . '</br>';

// Fetch the data from the API
$responseData = file_get_contents($url);
if ($responseData === false) {
    die('Error fetching the scores.');
}

// Decode JSON data
$games = json_decode($responseData, true);

if (empty($week)) {
    // Get current week from the JSON data
    $week = $games['week']['number'];
}
echo "Week: " . $week . "<br />";

// Build scores array to group teams and scores together in games
$scores = array();
foreach ($games['events'] as $event) {
    $game = $event['competitions'][0];
    $home_team = $game['competitors'][0]['team']['abbreviation'];
    $away_team = $game['competitors'][1]['team']['abbreviation'];

    $home_score = (int)$game['competitors'][0]['score'];
    $away_score = (int)$game['competitors'][1]['score'];

    // Handle the "LA" team abbreviation, if needed
    if ($home_team == "LA") $home_team = "LAR";
    if ($away_team == "LA") $away_team = "LAR";

    $final = ($game['status']['type']['completed']) ? 1 : 0;
    $overtime = ($game['status']['period'] > 4) ? 1 : 0;

    $winner = ($away_score > $home_score) ? $away_team : $home_team;
    $gameID = getGameIDByTeamID($week, $home_team);

    if (is_numeric(strip_tags($home_score)) && is_numeric(strip_tags($away_score))) {
        if ($away_score > 0 || $home_score > 0) {
            $scores[] = array(
                'gameID' => $gameID,
                'awayteam' => $away_team,
                'visitorScore' => $away_score,
                'hometeam' => $home_team,
                'homeScore' => $home_score,
                'overtime' => $overtime,
                'winner' => $winner,
                'final' => $final
            );
        }
    }
}

// Update the scores in the database if BATCH_SCORE_UPDATE_ENABLED is set
if (BATCH_SCORE_UPDATE_ENABLED && !empty($_GET['BATCH_SCORE_UPDATE_KEY']) && $_GET['BATCH_SCORE_UPDATE_KEY'] == BATCH_SCORE_UPDATE_KEY) {
    foreach ($scores as $game) {
        $homeScore = ((strlen($game['homeScore']) > 0) ? $game['homeScore'] : 'NULL');
        $visitorScore = ((strlen($game['visitorScore']) > 0) ? $game['visitorScore'] : 'NULL');
        $overtime = ((!empty($game['overtime'])) ? '1' : '0');
        $final = ((!empty($game['final'])) ? '1' : '0');
        $sql = "UPDATE " . DB_PREFIX . "schedule ";
        $sql .= "SET homeScore = " . $homeScore . ", visitorScore = " . $visitorScore . ", overtime = " . $overtime . ", final = " . $final . " ";
        $sql .= "WHERE gameID = " . $game['gameID'];
        if ($_GET['execute'] == 1) {
            $mysqli->query($sql) or die('Error updating score: ' . $mysqli->error);
        }
        echo $game['hometeam'] . ' hosting ' . $game['awayteam'] . ' => ' . $sql . '<br />';
    }
}

// Debugging output
echo '<hr /><strong>Scores:</strong><br/><pre>' . print_r($scores, true) . '</pre>';
echo '<hr /><strong>Raw Data:</strong><br/><pre>' . print_r($games, true) . '</pre>';
?>

