function aim(exp_no) {
    $('#aim').removeClass();
    $('#theory').removeClass();
    $('#procedure').removeClass();
    $('#test').removeClass();
    $('#simulation').removeClass();
    $('#references').removeClass();

    $('#aim').addClass('p-2 current-item');
    $('#theory').addClass('p-2');
    $('#procedure').addClass('p-2');
    $('#test').addClass('p-2');
    
    $('#simulation').addClass('p-2');
    $('#references').addClass('p-2');
      $.ajax({
        type : "GET",
        url : '/aim?exp_no='+exp_no,
        dataType : 'json',

        success: function(result) {            
            var html = '<span class="lab-name"> <h2 class="text-center">' + result[0].title + '</h2> </span> <div><div><p>' + result[0].aim + '</p></div></div>';
            $('#page_content').empty();
            $('#page_content').append(html);
        },
        
        error : function(err){
            console.log("Get Aim Error",err);
        }
      });
}

function theory(exp_no) {
    $('#aim').removeClass();
    $('#theory').removeClass();
    $('#procedure').removeClass();
    $('#test').removeClass();
    $('#simulation').removeClass();
    $('#references').removeClass();

    $('#theory').addClass('p-2 current-item');
    $('#aim').addClass('p-2');
    $('#procedure').addClass('p-2');
    $('#test').addClass('p-2');
    $('#simulation').addClass('p-2');
    $('#references').addClass('p-2');
    $.ajax({
        type : "GET",
        url : '/aim?exp_no='+exp_no,
        dataType : 'json',

        success: function(result) {            
            var html = '<span class="lab-name"> <h2 class="text-center">' + result[0].title + '</h2> </span> <div><div><p>' + result[0].theory + '</p></div></div>';
            $('#page_content').empty();
            $('#page_content').append(html);
        },
        
        error : function(err){
            console.log("Get Theory Error",err);
        }
    });
}