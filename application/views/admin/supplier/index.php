<section class="content-header">
	<h1><?=$title;?></h1>
	<ol class="breadcrumb">
		<li><i class="fa fa-home"></i> Home</li>
		<li><a href="<?=site_url();?>admin/account/index"><i class="fa fa-table"></i> List Supplier</a></li>
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
									<th style="width:200px;">Nama Perusahaan</th>
									<th style="width:200px;">Alamat</th>
									<th style="width:150px;">Provinsi</th>
									<th style="width:150px;">Kota</th>
									<th>Kode POS</th>
									<th>No Telepon</th>
									<th>No Fax</th>
									<th>Email</th>
									<th>PIC</th>
									<th>No Handphone</th>
									<th>Bank</th>
									<th>No Rekening</th>
									<th>Atas Nama</th>
									<th style="width:200px;">Catatan</th>
									<th class="text-center" style="width:130px;"><i class="fa fa-cogs"></i></th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<form id="form_edit" class="form-horizontal" action="#" method="post">
	<div class="modal fade" id="modal-edit">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">Edit Supplier</h4>
				</div>
				<div class="modal-body">
					
					<div class="form-group">
						<label for="edit_nama" class="col-sm-2 control-label">Nama Perusahaan</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="edit_nama" name="edit_nama" placeholder="Nama" minlength="3" maxlength="100" required>
						</div>
					</div>

					<div class="form-group">
						<label for="alamat" class="col-sm-2 control-label">Alamat</label>
						<div class="col-sm-6">
							<textarea class="form-control" id="edit_alamat" name="edit_alamat" placeholder="Alamat" required></textarea>
						</div>
					</div>

					<div class="form-group">
						<label for="edit_id_provinsi" class="col-sm-2 control-label">Provinsi</label>
						<div class="col-sm-6">
							<select class="form-control select2" id="edit_id_provinsi" name="edit_id_provinsi" data-placeholder="Provinsi" style="width:100%;" required>
								<option value=""></option>
								<?php
								foreach ($arr_provinsi->result() as $key) {
									echo '<option value="'.$key->id.'">'.$key->nama.'</option>';
								}
								?>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label for="edit_id_kota" class="col-sm-2 control-label">Kota</label>
						<div class="col-sm-6">
							<select class="form-control select2" id="edit_id_kota" name="edit_id_kota" data-placeholder="Kota" style="width:100%;" required disabled>
								<option value=""></option>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label for="edit_kodepos" class="col-sm-2 control-label">Kode POS</label>
						<div class="col-sm-6">
							<input type="number" class="form-control" id="edit_kodepos" name="edit_kodepos" placeholder="Kode POS" minlength="3" maxlength="6" required>
						</div>
					</div>

					<div class="form-group">
						<label for="edit_no_telepon" class="col-sm-2 control-label">No Telepon</label>
						<div class="col-sm-6">
							<input type="number" class="form-control" id="edit_no_telepon" name="edit_no_telepon" placeholder="No Telepon" minlength="3" maxlength="20" required>
						</div>
					</div>

					<div class="form-group">
						<label for="edit_no_fax" class="col-sm-2 control-label">No FAX</label>
						<div class="col-sm-6">
							<input type="number" class="form-control" id="edit_no_fax" name="edit_no_fax" placeholder="No FAX" minlength="3" maxlength="20">
						</div>
					</div>

					<div class="form-group">
						<label for="edit_email" class="col-sm-2 control-label">Email</label>
						<div class="col-sm-6">
							<input type="email" class="form-control" id="edit_email" name="edit_email" placeholder="Email" minlength="3" maxlength="100">
						</div>
					</div>

					<div class="form-group">
						<label for="edit_pic" class="col-sm-2 control-label">PIC</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="edit_pic" name="edit_pic" placeholder="PIC" minlength="3" maxlength="100">
						</div>
					</div>

					<div class="form-group">
						<label for="edit_no_handphone" class="col-sm-2 control-label">No Handphone</label>
						<div class="col-sm-6">
							<input type="number" class="form-control" id="edit_no_handphone" name="edit_no_handphone" placeholder="No Handphone" minlength="3" maxlength="100">
						</div>
					</div>

					<hr>

					<div class="form-group">
						<label for="edit_no_rekening" class="col-sm-2 control-label">No Rekening</label>
						<div class="col-sm-6">
							<input type="number" class="form-control" id="edit_no_rekening" name="edit_no_rekening" placeholder="No Rekening" minlength="3" maxlength="100">
						</div>
					</div>

					<div class="form-group">
						<label for="edit_id_bank" class="col-sm-2 control-label">Bank</label>
						<div class="col-sm-6">
							<select class="form-control select2" id="edit_id_bank" name="edit_id_bank" data-placeholder="Bank" style="width:100%;">
								<option value=""></option>
								<?php
								foreach ($arr_bank->result() as $key) {
									echo '<option value="'.$key->id.'">'.$key->nama.'</option>';
								}
								?>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label for="edit_atas_nama" class="col-sm-2 control-label">Atas Nama</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="edit_atas_nama" name="edit_atas_nama" placeholder="Atas Nama" minlength="3" maxlength="100">
						</div>
					</div>

					<hr>

					<div class="form-group">
						<label for="edit_catatan" class="col-sm-2 control-label">Catatan</label>
						<div class="col-sm-6">
							<textarea class="form-control" id="edit_catatan" name="edit_catatan" placeholder="Catatan"></textarea>
						</div>
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