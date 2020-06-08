<section class="content-header">
	<h1>Supplier <small>Tambah Supplier</small></h1>
	<ol class="breadcrumb">
		<li><i class="fa fa-home"></i> Home</li>
		<li><a href="<?=site_url();?>admin/supplier/index"><i class="fa fa-users"></i> Supplier</a></li>
			<li><a href="<?=site_url();?>admin/supplier/create"><i class="fa fa-plus"></i> Tambah Supplier</a></li>
		</ol>
	</section>

	<section class="content">

		<?php
		if($this->session->flashdata('success') === TRUE){
		?>
			<div class="alert alert-success">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				<strong>Supplier berhasil dibuat</strong>
			</div>
		<?php } ?>

		<?php
		if($this->session->flashdata('error') === TRUE){
		?>
			<div class="alert alert-danger">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				<strong><?=GA_KONEK;?></strong>
			</div>
		<?php } ?>

		<div class="row">
			<div class="col-xs-12">
				<div class="box box-info">
					<div class="box-header with-border">
						<h3 class="box-title">Data Supplier</h3>
					</div>

					<form class="form-horizontal" method="post" action="<?=site_url();?>admin/supplier/create">
						<div class="box-body">

							<div class="form-group">
								<label for="nama" class="col-sm-2 control-label">Nama Perusahaan</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="nama" name="nama" placeholder="Nama" minlength="3" maxlength="100" value="<?=set_value('nama');?>" required>
									<?=form_error('nama');?>
								</div>
							</div>

							<div class="form-group">
								<label for="alamat" class="col-sm-2 control-label">Alamat</label>
								<div class="col-sm-6">
									<textarea class="form-control" id="alamat" name="alamat" placeholder="Alamat" required><?=set_value('alamat');?></textarea>
									<?=form_error('alamat');?>
								</div>
							</div>

							<div class="form-group">
								<label for="id_provinsi" class="col-sm-2 control-label">Provinsi</label>
								<div class="col-sm-6">
									<select class="form-control select2" id="id_provinsi" name="id_provinsi" data-placeholder="Provinsi" required>
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
								<label for="id_kota" class="col-sm-2 control-label">Kota</label>
								<div class="col-sm-6">
									<select class="form-control select2" id="id_kota" name="id_kota" data-placeholder="Kota" disabled>
										<option value=""></option>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label for="kodepos" class="col-sm-2 control-label">Kode POS</label>
								<div class="col-sm-6">
									<input type="number" class="form-control" id="kodepos" name="kodepos" placeholder="Kode POS" minlength="3" maxlength="6" required>
								</div>
							</div>

							<div class="form-group">
								<label for="no_telepon" class="col-sm-2 control-label">No Telepon</label>
								<div class="col-sm-6">
									<input type="number" class="form-control" id="no_telepon" name="no_telepon" placeholder="No Telepon" minlength="3" maxlength="20" required>
								</div>
							</div>

							<div class="form-group">
								<label for="no_fax" class="col-sm-2 control-label">No FAX</label>
								<div class="col-sm-6">
									<input type="number" class="form-control" id="no_fax" name="no_fax" placeholder="No FAX" minlength="3" maxlength="20">
								</div>
							</div>

							<div class="form-group">
								<label for="email" class="col-sm-2 control-label">Email</label>
								<div class="col-sm-6">
									<input type="email" class="form-control" id="email" name="email" placeholder="Email" minlength="3" maxlength="100">
								</div>
							</div>

							<div class="form-group">
								<label for="pic" class="col-sm-2 control-label">PIC</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="pic" name="pic" placeholder="PIC" minlength="3" maxlength="100">
								</div>
							</div>

							<div class="form-group">
								<label for="no_handphone" class="col-sm-2 control-label">No Handphone</label>
								<div class="col-sm-6">
									<input type="number" class="form-control" id="no_handphone" name="no_handphone" placeholder="No Handphone" minlength="3" maxlength="100">
								</div>
							</div>

							<hr>

							<div class="form-group">
								<label for="no_rekening" class="col-sm-2 control-label">No Rekening</label>
								<div class="col-sm-6">
									<input type="number" class="form-control" id="no_rekening" name="no_rekening" placeholder="No Rekening" minlength="3" maxlength="100">
								</div>
							</div>

							<div class="form-group">
								<label for="id_bank" class="col-sm-2 control-label">Bank</label>
								<div class="col-sm-6">
									<select class="form-control select2" id="id_bank" name="id_bank" data-placeholder="Bank">
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
								<label for="atas_nama" class="col-sm-2 control-label">Atas Nama</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="atas_nama" name="atas_nama" placeholder="Atas Nama" minlength="3" maxlength="100">
								</div>
							</div>

							<hr>

							<div class="form-group">
								<label for="catatan" class="col-sm-2 control-label">Catatan</label>
								<div class="col-sm-6">
									<textarea class="form-control" id="catatan" name="catatan" placeholder="Catatan"></textarea>
								</div>
							</div>

						</div>
						<!-- /.box-body -->
						<div class="box-footer">
							<button type="submit" class="btn btn-info">Simpan</button>
							<a href="<?=site_url();?>admin/supplier/index" class="btn btn-default pull-right">Kembali ke List Supplier</a>
						</div>
						<!-- /.box-footer -->
					</form>
				</div>
			</div>
		</div>

	</section>