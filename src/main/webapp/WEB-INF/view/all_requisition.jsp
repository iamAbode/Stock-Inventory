<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">       
    <link rel="icon" type="image/jpg" href="<%= request.getContextPath() %>/assets/images/profess.png" /> 
    <title>IMS Solution</title>
    <jsp:include page="include/basic_css.jsp" />
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
           <!-- side bar -->
       <jsp:include page="include/sidebar.jsp" />

        <!-- top navigation -->
        <jsp:include page="include/top_navigation.jsp" />
       
        <!-- page content -->
        <div class="right_col" role="main">
         <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Items</h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    <input id="keywords" name="keywords" type="text" class="form-control" placeholder="Search for..." onkeyup="searchFilter()">
                    <span class="input-group-btn">
                              <button class="btn btn-default" type="button" onclick="searchFilter()">Go!</button>
                          </span>
                  </div>
                </div>
              </div>
            </div>            
            <div class="row">                
             <div id="dataModal" class="modal fade">
 <div class="modal-dialog modal-lg">
  <div class="modal-content">
   <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal">&times;</button>
    <h4 class="modal-title">Detail</h4>
   </div>
   <div class="modal-body" id="employee_detail">
    
   </div>
   <div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
   </div>
  </div>
 </div>
</div>                   
            </div>
            
            
            <div class="row">
     <div class="panel panel-default users-content">
      <div class="panel-heading">
          <div class="post-search-panel">    
    <select id="showLimit" onchange="searchFilter()">
        <option value="10">10</option>
        <option value="20">20</option>
        <option value="30">30</option>
    </select>
         <span class="loading-overlay" style="display:none"><img src="<%= request.getContextPath() %>/assets/build/images/btn-ajax-loader.gif" height="18" width="18" /></span>
    <ul class="nav navbar-right panel_toolbox">
    <li>  </li>                     
                      
                    </ul>  
          </div>
          </div>      
           
         
         
            
   <div id="posts_content" class="table-responsive">        
             
    </div> 
    </div>
    </div>   
       
         </div>          
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <jsp:include page="include/footer.jsp" />
        <!-- /footer content -->
      </div>
    </div>
    
	 <jsp:include page="include/basic_js.jsp" />
	      
    <script>
    $(document).ready( function () {
    	searchFilter(); 
    	
    	});
    
    function searchFilter(page_num) {  
        page_num = page_num?page_num:0;
        document.cookie = "current_page=" +page_num;
        var keywords = $('#keywords').val();      
        var showLimit = $('#showLimit').val();           
        $.ajax({
            type: 'GET',            
            url: "api/allreq",
            data:'page='+page_num+'&limit='+showLimit+'&keywords='+keywords,
            beforeSend: function () { 
                $('.loading-overlay').show();
            },
            success: function (data) {       	
                $('#posts_content').html(data);
                $('.loading-overlay').fadeOut("slow");            	
            }
        });
        
    }   
    
 function getAllDept(){     	
	 $.ajax({
	        type: 'GET',
	        dataType:'JSON',
	        url: 'api/alldept',
	        data: 'id=all',
	        beforeSend: function () { 
          $('.loading-overlay').show();
        },
	        success:function(data){         
	        
	        $('.loading-overlay').fadeOut("slow");      
	        }
	    });
	}  
 
 
    </script>
    </body>
</html>
