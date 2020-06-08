<section class="content-header">
	<h1><?=$title;?></h1>
	<ol class="breadcrumb">
		<li><i class="fa fa-home"></i> Home</li>
		<li><a href="<?=site_url();?>admin/account/index"><i class="fa fa-table"></i> List Produk</a></li>
	</ol>
</section>

<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="box box-info">
				<div class="box-body">
					<div class="table-responsive">
						<table id="datatables" class="table table-bordered small">
							<thead>
								<tr>
									<th>Kode</th>
									<th>Nama</th>
									<th>Alias</th>
									<th>Kategori</th>
									<th>Satuan</th>
									<th>Harga Beli</th>
									<th>Harga Jual</th>
									<th>Harga Grosir</th>
									<th>Margin Jual</th>
									<th>Margin Grosir</th>
									<th>Qty</th>
									<th class="text-center" style="min-width: 150px;"><i class="fa fa-cogs"></i></th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<form id="form_edit" action="#" method="post">
	<div class="modal fade" id="modal-edit">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">Edit Produk</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="edit_username">Username</label>
						<input type="text" class="form-control" id="edit_username" name="edit_username" disabled>
					</div>
					<div class="form-group">
						<label for="edit_nama">Nama</label>
						<input type="text" class="form-control" id="edit_nama" name="edit_nama" required>
					</div>
					<div class="form-group">
						<label for="edit_role">Role</label>
						<select class="form-control" id="edit_role" name="edit_role" required>
							<option value=""></option>
							<option value="admin">Admin</option>
							<option value="kasir">Kasir</option>
							<option value="master">Master Admin</option>
						</select>
					</div>
				</div>
				<div class="modal-footer">
					<input type="hidden" id="edit_id" name="edit_id">
					<button type="submit" id="edit_submit" class="btn btn-primary">Edit</button>
					<button type="button" class="btn btn-default pull-right" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</form>

<form id="form_reset" action="#" method="post">
	<div class="modal fade" id="modal-reset">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">Reset Password</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="reset_username_text">Username</label>
						<input type="text" class="form-control" id="reset_username_text" name="reset_username_text" disabled>
					</div>
					<div class="form-group">
						<label for="reset_password">New Password</label>
						<input type="password" class="form-control" id="reset_password" name="reset_password" required>
					</div>
				</div>
				<div class="modal-footer">
					<input type="hidden" id="reset_id" name="reset_id">
					<input type="hidden" id="reset_username" name="reset_username">
					<button type="submit" id="reset_submit" class="btn btn-primary">Reset</button>
					<button type="button" class="btn btn-default pull-right" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</form>