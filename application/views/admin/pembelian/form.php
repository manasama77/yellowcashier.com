<section class="content-header">
	<h1>Produk <small>Tambah Pembelian</small></h1>
	<ol class="breadcrumb">
		<li><i class="fa fa-home"></i> Home</li>
		<li><a href="<?= site_url(); ?>admin/product/index"><i class="fa fa-cubes"></i> Produk</a></li>
		<li><a href="<?= site_url(); ?>admin/pembelian/index"><i class="fa fa-cart-arrow-down"></i> Pembelian</a></li>
		<li><a href="<?= site_url(); ?>admin/pembelian/create"><i class="fa fa-plus"></i> Tambah Pembelian</a></li>
	</ol>
</section>

<section class="content">

	<?php
	if ($this->session->flashdata('success') === TRUE) {
	?>
		<div class="alert alert-success">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			<strong>Produk berhasil dibuat</strong>
		</div>
	<?php } ?>

	<?php
	if ($this->session->flashdata('error') === TRUE) {
	?>
		<div class="alert alert-danger">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			<strong><?= GA_KONEK; ?></strong>
		</div>
	<?php } ?>

	<div class="row">
		<div class="col-xs-12">
			<div class="box box-info">
				<div class="box-header with-border">
					<h3 class="box-title">Pembelian</h3>
				</div>

				<form class="form-horizontal" method="post" action="<?= site_url(); ?>admin/pembelian/store">
					<div class="box-body">

						<div class="form-group">
							<label for="barcode" class="col-sm-2 control-label">Tanggal Pembelian</label>
							<div class="col-sm-6">
								<input type="date" class="form-control" id="barcode" name="barcode" placeholder="Barcode" minlength="3" maxlength="100" value="<?= set_value('barcode'); ?>" required autofocus>
								<?= form_error('barcode'); ?>
							</div>
						</div>

						<div class="form-group">
							<label for="kode" class="col-sm-2 control-label">Kode</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="kode" name="kode" placeholder="Kode" minlength="1" maxlength="5" value="<?= set_value('kode'); ?>" required>
								<?= form_error('kode'); ?>
							</div>
						</div>

						<div class="form-group">
							<label for="nama" class="col-sm-2 control-label">Nama</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="nama" name="nama" placeholder="Nama" minlength="3" maxlength="100" value="<?= set_value('nama'); ?>" required>
								<?= form_error('nama'); ?>
							</div>
						</div>

						<div class="form-group">
							<label for="alias" class="col-sm-2 control-label">Alias</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="alias" name="alias" placeholder="Alias" minlength="3" maxlength="100" required>
								<?= form_error('alias'); ?>
							</div>
						</div>

						<div class="form-group">
							<label for="id_kategori" class="col-sm-2 control-label">Kategori</label>
							<div class="col-sm-2">
								<select class="form-control select2" id="id_kategori" name="id_kategori" data-placeholder="Kategori">
									<option value=""></option>
									<?php
									foreach ($arr_kategori->result() as $key) {
										echo '<option value="' . $key->id . '">' . $key->nama . '</option>';
									}
									?>
								</select>
								<?= form_error('id_kategori'); ?>
							</div>
						</div>

						<div class="form-group">
							<label for="id_satuan" class="col-sm-2 control-label">Satuan</label>
							<div class="col-sm-2">
								<select class="form-control select2" id="id_satuan" name="id_satuan" data-placeholder="Satuan">
									<option value=""></option>
									<?php
									foreach ($arr_satuan->result() as $key) {
										echo '<option value="' . $key->id . '">' . $key->nama . '</option>';
									}
									?>
								</select>
								<?= form_error('id_satuan'); ?>
							</div>
						</div>

						<div class="form-group">
							<label for="hpp" class="col-sm-2 control-label">Harga Beli</label>
							<div class="col-sm-6">
								<div class="input-group">
									<span class="input-group-addon" style="background-color: #ccc;">Rp.</span>
									<input type="number" class="form-control" id="hpp" name="hpp" placeholder="Harga Beli" min="1" max="9999999999999999" required>
									<span class="input-group-addon" style="background-color: #ccc;">.</span>
									<input type="number" class="form-control" id="hpp_decimal" name="hpp_decimal" placeholder="Desimal" min="0" max="99" required>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="hpj" class="col-sm-2 control-label">Harga Jual</label>
							<div class="col-sm-6">
								<div class="input-group">
									<span class="input-group-addon" style="background-color: #ccc;">Rp.</span>
									<input type="number" class="form-control" id="hpj" name="hpj" placeholder="Harga Jual" min="1" max="9999999999999999" required>
									<span class="input-group-addon" style="background-color: #ccc;">.</span>
									<input type="number" class="form-control" id="hpj_decimal" name="hpj_decimal" placeholder="Desimal" min="0" max="99" required>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="hpg" class="col-sm-2 control-label">Harga Grosir</label>
							<div class="col-sm-6">
								<div class="input-group">
									<span class="input-group-addon" style="background-color: #ccc;">Rp.</span>
									<input type="number" class="form-control" id="hpg" name="hpg" placeholder="Harga Grosir" min="1" max="9999999999999999" required>
									<span class="input-group-addon" style="background-color: #ccc;">.</span>
									<input type="number" class="form-control" id="hpg_decimal" name="hpg_decimal" placeholder="Desimal" min="0" max="99" required>
								</div>
							</div>
						</div>

						<div class="form-group row">
							<label for="margin_hpj" class="col-sm-2 control-label">Margin Jual</label>
							<div class="col-sm-2">
								<div class="input-group">
									<input type="number" class="form-control" id="margin_hpj" name="margin_hpj" required readonly>
									<span class="input-group-addon">%</span>
								</div>
							</div>
							<label for="margin_hpg" class="col-sm-2 control-label">Margin Grosir</label>
							<div class="col-sm-2">
								<div class="input-group">
									<input type="number" class="form-control" id="margin_hpg" name="margin_hpg" required readonly>
									<span class="input-group-addon">%</span>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="foto" class="col-sm-2 control-label">Foto</label>
							<div class="col-sm-6">
								<input type="file" class="form-control" id="foto" name="foto" accept="image/*">
								<img id="thumbnail" class="img-thumbnail foto" src="#" alt="" />
							</div>
						</div>

					</div>
					<!-- /.box-body -->
					<div class="box-footer">
						<button type="submit" id="submit" class="btn btn-info">Simpan</button>
						<a href="<?= site_url(); ?>admin/product/index" class="btn btn-default pull-right">Kembali ke List Produk</a>
					</div>
					<!-- /.box-footer -->
				</form>
			</div>
		</div>
	</div>

</section>