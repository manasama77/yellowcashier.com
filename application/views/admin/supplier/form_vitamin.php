<script>
	$(document).ready(function(){
		$('#id_provinsi').on('change', function(){

			if($(this).val().length > 0){

				$.ajax({
					url: `<?=site_url();?>admin/supplier/get_list_kota`,
					method: 'get',
					dataType: 'json',
					data: { id_provinsi: $(this).val() },
					beforeSend: function(){
						$('#id_kota').val(null).html(null).attr('disabled', true);
						$.blockUI();
					}
				}).done(function(res){
					console.log(res);
					if(res.code == 200){
						let html = `<option value=""></option>`;
						$.each(res.data, function(i, k){
							html += `
							<option value="${k.id}">${k.nama}</option>
							`;
							$('#id_kota').html(html).attr('disabled', false);
						});
					}else{
						alert(`<?=GA_KONEK;?>`);
					}
					$.unblockUI();
				});

			}else{
				$('#id_kota').val(null).html(null).attr('disabled', true);
			}

		});
	});
</script>