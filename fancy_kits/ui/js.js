

$(document).ready(function() {
    $('body').fadeOut();

    window.addEventListener('message', function(event) {
        let action = event.data.action

        if (action == "open"){
            console.log('test')
            $('body').fadeIn(500);
        } })


    $(document).on('keyup', function(e) {
        
        if (e.key == "Escape") $.post(`https://${GetParentResourceName()}/closeMenu`, JSON.stringify({})), $('body').fadeOut(500);
    });
    

    $('#kit_start_button').click(function() {
        $('body').fadeOut(500);
        $.post(`https://${GetParentResourceName()}/kitStarter`, JSON.stringify({}))
      });

      $('#kit_booster_button').click(function() {
        $('body').fadeOut(500);
        $.post(`https://${GetParentResourceName()}/kitBooster`, JSON.stringify({}))
      });
      $('#kit_vip_button').click(function() {
        $('body').fadeOut(500);
        $.post(`https://${GetParentResourceName()}/kitVip`, JSON.stringify({}))
      });
      
})

// $(document).ready(function() {
//     $('body').fadeIn();
//   });
