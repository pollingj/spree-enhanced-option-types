$(document).ready(function() {
  $('.editable').editable(window.location.href + '/inline_update', {
    indicator   : 'Saving...',
    tooltip     : 'Click to edit...',
    method      : 'PUT',
    submitdata  : function(old_value, value, settings) {
      var field_parts = this.id.split('-');
      return {
        column: field_parts.pop(),
        id: field_parts.pop(),
        model: field_parts.pop()
      };
    }
  });
});