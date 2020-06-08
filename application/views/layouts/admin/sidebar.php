<aside class="main-sidebar">
	
	<section class="sidebar">

		<ul class="sidebar-menu" data-widget="tree">
			<li class="header">MAIN NAVIGATION</li>

			<li>
				<a href="<?=site_url();?>admin/dashboard">
					<i class="fa fa-dashboard"></i> <span>Dashboard</span>
				</a>
			</li>

			<li class="header">PRODUK MANAGEMENT</li>

			<li class="treeview">
				<a href="#">
					<i class="fa fa-cubes"></i> <span>Produk</span>
					<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
					</span>
				</a>
				<ul class="treeview-menu">
					<li>
						<a href="<?=site_url();?>admin/product/create"><i class="fa fa-plus"></i> Tambah Produk</a>
					</li>
					<li>
						<a href="<?=site_url();?>admin/product/index"><i class="fa fa-cubes"></i> List Produk</a>
					</li>
					<li>
						<a href="<?=site_url();?>admin/correction/index"><i class="fa fa-clock-o"></i> Kadarluarsa</a>
					</li>
					<li>
						<a href="<?=site_url();?>admin/correction/index"><i class="fa fa-pencil"></i> Koreksi</a>
					</li>

					<li><hr class="hr_divider"></li>
					<li class="treeview">
						<a href="#">
							<i class="fa  fa-cart-arrow-down"></i> Pembelian
							<span class="pull-right-container">
								<i class="fa fa-angle-left pull-right"></i>
							</span>
						</a>
						<ul class="treeview-menu">
							<li>
								<a href="<?=site_url();?>admin/pembelian/create">
									<i class="fa fa-plus"></i> <span>Tambah Pembelian</span>
								</a>
							</li>
							<li>
								<a href="<?=site_url();?>admin/pembelian/index">
									<i class="fa fa-table"></i> <span>List Pembelian</span>
								</a>
							</li>
						</ul>
					</li>

					<li><hr class="hr_divider"></li>

					<li>
						<a href="<?=site_url();?>admin/category/index"><i class="fa fa-tags"></i> Kategori</a>
					</li>

					<li>
						<a href="<?=site_url();?>admin/unit/index"><i class="fa fa-balance-scale"></i> Satuan</a>
					</li>

				</ul>
			</li>

			<?php
			if($this->session->userdata(SESS.'role') == 'master'){
			?>

				<li class="header">UTILITY</li>
				<li class="treeview">
					<a href="#">
						<i class="fa fa-users"></i> <span>Akun Management</span>
						<span class="pull-right-container">
							<i class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
					<ul class="treeview-menu">
						<li>
							<a href="<?=site_url();?>admin/account/create"><i class="fa fa-plus"></i> Tambah Akun</a>
						</li>
						<li>
							<a href="<?=site_url();?>admin/account/index"><i class="fa fa-table"></i> List Akun</a>
						</li>
					</ul>
				</li>

				<li class="treeview">
					<a href="#">
						<i class="fa fa-truck"></i> <span>Supplier Management</span>
						<span class="pull-right-container">
							<i class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
					<ul class="treeview-menu">
						<li>
							<a href="<?=site_url();?>admin/supplier/create"><i class="fa fa-plus"></i> Tambah Supplier</a>
						</li>
						<li>
							<a href="<?=site_url();?>admin/supplier/index"><i class="fa fa-table"></i> List Supplier</a>
						</li>
					</ul>
				</li>

			<?php
			}
			?>

		</ul>
	</section>

</aside>