<script>
	$(document).ready(function() {
		$('#foto').on('change', function() {
			readURL(this);
		});

		$('#barcode').on('input', function() {
			checkKode();
		});
		$('#kode').on('input', function() {
			checkKode();
		});
		$('#hpp').on('input', function() {
			hitungMargin();
		});
		$('#hpj').on('input', function() {
			hitungMargin();
		});
		$('#hpg').on('input', function() {
			hitungMargin();
		});
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#thumbnail').attr('src', e.target.result);
			}

			reader.readAsDataURL(input.files[0]);
		}
	}

	function checkKode() {
		let barcode = $('#barcode').val();
		let kode = $('#kode').val();

		if (barcode.length > 0 && kode.length > 0) {
			$.ajax({
				url: `<?= site_url(); ?>admin/product/check_kode`,
				method: 'get',
				dataType: 'json',
				data: {
					barcode: barcode,
					kode: kode
				},
				beforeSend: function() {
					$('#submit').attr('disabled', true);
				}
			}).done(function(res) {
				if (res.code == 500) {
					alert('Barcode / Kode Telah Digunakan');
					$('#submit').attr('disabled', true);
				} else {
					$('#submit').attr('disabled', false);
				}
			});
		} else {
			$('#submit').attr('disabled', true);
		}
	}

	function hitungMargin() {
		let hpp = $('#hpp').val();
		let hpj = $('#hpj').val();
		let hpg = $('#hpg').val();

		if (hpp.length == 0) {
			alert('Silahkan isi Harga Beli terlebih dahulu');
			$('#hpp').focus();
			$('#hpj').val(null);
			$('#hpg').val(null);
			$('#margin_hpj').val(null);
			$('#margin_hpg').val(null);
		}

		if (hpj.length > 0) {
			let profit_hpj = hpj - hpp;
			let margin_hpj = (profit_hpj / hpp) * 100
			$('#margin_hpj').val(margin_hpj.toFixed(2));
		}

		if (hpg.length > 0) {
			let profit_hpg = hpg - hpp;
			let margin_hpg = (profit_hpg / hpp) * 100
			$('#margin_hpg').val(margin_hpg.toFixed(2));
		}
	}
</script>