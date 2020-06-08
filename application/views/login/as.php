<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Yellow Cashier | Log in As</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

	<link rel="stylesheet" href="<?= base_url(); ?>vendor/bootstrap/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="<?= base_url(); ?>vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="<?= base_url(); ?>vendor/adminlte/css/AdminLTE.css">
	<link rel="stylesheet" href="<?= base_url(); ?>vendor/iCheck/square/blue.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>

<body class="hold-transition login-page">
	<div class="container-fluid">

		<form class="form" method="post" action="<?=site_url();?>">
			<div class="login-box">
				<div class="register-logo">
					<img src="<?=base_url();?>public/img/logo/yellow_cashier_logo_100x100.png" width="100px">
					<b>Yellow</b>Cashier
				</div>
				<div class="box box-solid box-warning">
					<div class="box-header with-border">
						<h3 class="box-title"><i class="fa fa-user-secret"></i> Login As</h3>
					</div>
					<div class="box-body">
						<div class="row">
							<div class="col-md-6 text-center">
								<a href="<?=site_url();?>admin/dashboard" class="btn btn-primary btn-lg">
									Admin
								</a>
							</div>
							<div class="col-md-6 text-center">
								<a href="<?=site_url();?>kasir/index" class="btn btn-warning btn-lg">
									Kasir
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>

	</div>
</body>

</html>

<script src="<?= base_url(); ?>vendor/jquery/dist/jquery.min.js"></script>
<script src="<?= base_url(); ?>vendor/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="<?= base_url(); ?>vendor/iCheck/icheck.min.js"></script>
<script>
	$(document).ready(function() {
		$('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' /* optional */
    });
	});
</script>