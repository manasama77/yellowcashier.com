<section class="content-header">
	<h1><?=$title;?></h1>
	<ol class="breadcrumb">
		<li><i class="fa fa-home"></i> Home</li>
		<li><i class="fa fa-cubes"></i> Produk</li>
		<li><a href="<?=site_url();?>admin/unit/index"><i class="fa fa-balance-scale"></i> Satuan</a></li>
	</ol>
</section>

<section class="content">
	<div class="row">

		<div class="col-md-6">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">Satuan</h3>
				</div>
				<div class="box-body">
					<div class="table-responsive">
						<table id="datatables" class="table table-bordered small">
							<thead>
								<tr>
									<th>Nama</th>
									<th class="text-center" style="width: 120px;"><i class="fa fa-cogs"></i></th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>

		<form id="form_add" method="post" action="#">
			<div class="col-md-4 col-md-offset-2">
				<div class="box box-warning">
					<div class="box-header with-border">
						<h3 class="box-title">Tambah Satuan</h3>
					</div>
					<div class="box-body">
						<div class="form-group">
							<label for="nama">Nama Satuan</label>
							<input type="text" class="form-control" id="nama" name="nama" required>
						</div>
					</div>
					<div class="box-footer">
						<button type="submit" id="add_submit" class="btn btn-primary btn-block btn-flat">Tambah Data</button>
					</div>
				</div>
			</div>
		</form>

	</div>
</section>

<form id="form_edit" action="#" method="post">
	<div class="modal fade" id="modal-edit">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">Edit Satuan</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="edit_nama">Nama</label>
						<input type="text" class="form-control" id="edit_nama" name="edit_nama" disabled>
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