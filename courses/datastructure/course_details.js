function intro(course_code) {
    $('#intro').removeClass();
    $('#obj').removeClass();
    $('#list_of_exp').removeClass();

    $('#intro').addClass('p-2 current-item');
    $('#obj').addClass('p-2');
    $('#list_of_exp').addClass('p-2');

    $.ajax({
    type : "GET",
    url : '/course_details?course_code='+course_code,
    dataType : 'json',

    success: function(result) {            
        var html = '<span class="lab-name"> <h2 class="text-center">' + result[0].course_name + '</h2> </span> <div><div><p>' + result[0].introduction + '</p></div></div>';
        $('#page_content').empty();
        $('#page_content').append(html);
    },
    
    error : function(err){
        console.log("Get Intro Error",err);
    }
    });
}

function obj(course_code) {
    $('#intro').removeClass();
    $('#obj').removeClass();
    $('#list_of_exp').removeClass();

    $('#obj').addClass('p-2 current-item');
    $('#intro').addClass('p-2');
    $('#list_of_exp').addClass('p-2');
    $.ajax({
        type : "GET",
        url : '/course_details?course_code='+course_code,
        dataType : 'json',

        success: function(result) {            
            var html = '<span class="lab-name"> <h2 class="text-center">' + result[0].course_name + '</h2> </span> <div><div><p>' + result[0].objective + '</p></div></div>';
            $('#page_content').empty();
            $('#page_content').append(html);
        },
        
        error : function(err){
            console.log("Get Intro Error",err);
        }
    });
}