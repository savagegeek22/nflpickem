			<div class="back2top"><a href="<?php echo $_SERVER['REQUEST_URI']; ?>#">Back to top</a></div>
		</div><!-- end pageContent row -->
<?php if (ENABLE_DONATE_FOOTER) { ?>
		<div id="footer">
			<div id="donate">
				<?php include('includes/donate_button.inc.php'); ?>
			</div>
		</div><!-- end pageContent row -->
<?php } ?>
	</div>
</body>
</html>
