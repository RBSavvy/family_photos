<% if @photo.new_record? %>
  alert("Failed to upload photo: <%= j @photo.errors.full_messages.join(', ').html_safe %>");
<% else %>
  $("#photos .row:last-child").append("<%= j render(@photo) %>");
<% end %>