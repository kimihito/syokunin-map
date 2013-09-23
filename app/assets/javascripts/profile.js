$(function(){
  $('.past_profiles').click(function(){
    var prof = $(this).data();
    $('#shokunin_name').val(prof.name);
    $('#shokunin_contact').val(prof.contact);
    $('#shokunin_content').val(prof.content);
    $('#shokunin_active')[0].checked=prof.active;
  });
});
