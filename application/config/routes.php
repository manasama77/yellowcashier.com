<?php
defined('BASEPATH') or exit('No direct script access allowed');

$route['404_override']         = '';
$route['translate_uri_dashes'] = FALSE;
$route['init/admin']           = 'InitController/init_admin';

//////////////////////////////////////////////////////////// LOGIN ADMIN
$route['default_controller'] = 'LoginController/index';
$route['login_as']     = 'LoginController/login_as';
$route['logout']             = 'LoginController/logout';

//////////////////////////////////////////////////////////// ADMIN
# DASHBOARD
$route['admin/dashboard'] = 'DashboardController/index';

# PRODUCT
$route['admin/product/index']      = 'ProductController/index';
$route['admin/product/create']     = 'ProductController/create';
$route['admin/product/store']      = 'ProductController/store';
$route['admin/product/destroy']    = 'ProductController/destroy';
$route['admin/product/check_kode'] = 'ProductController/check_kode';

########## PRODUCT => PEMBELIAN
$route['admin/pembelian/create'] = 'PembelianController/create';

########## PRODUCT => CATEGORY
$route['admin/category/index']   = 'CategoryController/index';
$route['admin/category/store']   = 'CategoryController/store';
$route['admin/category/update']  = 'CategoryController/update';
$route['admin/category/destroy'] = 'CategoryController/destroy';

########## PRODUCT => UNIT
$route['admin/unit/index']   = 'UnitController/index';
$route['admin/unit/store']   = 'UnitController/store';
$route['admin/unit/update']  = 'UnitController/update';
$route['admin/unit/destroy'] = 'UnitController/destroy';

########## UTILITY/ACCOUNT MANAGEMENT
$route['admin/account/index']   = 'AccountController/index';
$route['admin/account/create']  = 'AccountController/create';
$route['admin/account/update']  = 'AccountController/update';
$route['admin/account/destroy'] = 'AccountController/destroy';
$route['admin/account/reset']   = 'AccountController/reset';

########## UTILITY/SUPPLIER
$route['admin/supplier/index']         = 'SupplierController/index';
$route['admin/supplier/create']        = 'SupplierController/create';
$route['admin/supplier/update']        = 'SupplierController/update';
$route['admin/supplier/destroy']       = 'SupplierController/destroy';
$route['admin/supplier/get_list_kota'] = 'SupplierController/get_list_kota';

# DATATABLES
$route['datatables/datatables_product']  = 'ProductController/datatables';
$route['datatables/datatables_supplier'] = 'SupplierController/datatables';
$route['datatables/datatables_category'] = 'CategoryController/datatables';
$route['datatables/datatables_unit']     = 'UnitController/datatables';
$route['datatables/datatables_account']  = 'AccountController/datatables';

#UTILITY
$route['utility/uuid/(:num)'] = 'UtilityController/loop_uuid/$1';
