$('#exampleModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget); // Button that triggered the modal
            var name = button.data('name'); // Extract info from data-* attributes
            var colors = button.data('colors');
            var sizes = button.data('sizes');
            
//            colors = JSON.parse(colors);
//            sizes = JSON.parse(sizes);
            
            var modal = $(this);
            modal.find('.modal-title').text(name); // Set the title
            modal.find('#productName').val(name); // Set the hidden input value

            // Populate the color dropdown
            var colorSelect = modal.find('#colorSelect');
            colorSelect.empty();
            colors.forEach(function(color) {
                colorSelect.append('<option value="' + color + '">' + color + '</option>');
            });

            // Populate the size dropdown
            var sizeSelect = modal.find('#sizeSelect');
            sizeSelect.empty();
            sizes.forEach(function(size) {
                sizeSelect.append('<option value="' + size + '">' + size + '</option>');
            });
        });

        $('#saveChanges').on('click', function() {
            var formData = $('#modalForm').serialize();

            $.ajax({
                url: '/SWP391/product?service=addCart',
                type: 'POST',
                data: formData,
                success: function(response) {
                    // Handle the response from the servlet
                    $('#exampleModal').click();
//                    showAlert("Success");
                    $('#successMessage').show().delay(3000).fadeOut();
                    // Ensure the modal button is re-enabled
//                    $('[data-target="#exampleModal"]').prop('disabled', false);
                },
                error: function(xhr, status, error) {
                    // Handle the error
                    console.error(error);
                }
            });
        });
        
