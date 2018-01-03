<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>

<html lang="ko">
  <head>
  <title>IoT 실내환경</title>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style">
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/assets/css/iot_element.css" />

  <!-- Favicon and touch icons -->
  <link rel="icon" href="${pageContext.servletContext.contextPath}/ico/home_iot.png">
  <style>
    .modal-dialog {
      position: relative
      width:600px;
      margin:45px auto;
    }
    
    @media screen and (max-width: 480px) {

      button {
        padding: 0;
        width: auto;
      }
    }
  </style>
</head>

<body class="subpage">

  <!-- Header -->
  <header id="header">
    <div class="logo"><a href="${pageContext.servletContext.contextPath}/index.html">Donny <span>by TEMPLATED</span></a></div>
    <a href="#menu">Menu</a>
  </header>

  <!-- Nav -->
  <nav id="menu">
    <ul class="links">
      <li><a href="${pageContext.servletContext.contextPath}/index.html">메인</a></li>
      <li><a href="${pageContext.servletContext.contextPath}/loginmain.html">로그인</a></li>
      <li><a href="${pageContext.servletContext.contextPath}/mypage.html">마이페이지</a></li>
      <li><a href="${pageContext.servletContext.contextPath}/store_management.html">매장관리</a></li>
      <li><a href="${pageContext.servletContext.contextPath}/menu_info.html">메뉴관리?</a></li>
      <li><a href="${pageContext.servletContext.contextPath}/elements.html">빅데이터</a></li>
      <li><a href="${pageContext.servletContext.contextPath}/noticeboard.html">게시판</a></li>
      <li><a href="${pageContext.servletContext.contextPath}/index_admin.html">Admin Only</a></li>
    </ul>
  </nav>

                <!-- Modal -->
  <div class="container">
  <div id="my-modal" class="modal fade" tabindex="-1">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h3 class="smaller lighter blue no-margin">온도관리 상세설정</h3>
                      </div>

                      <div class="modal-body">
                        Some content to IoT Control
                        <br />
                        <br />
                        1
                        <br />
                        <br />
                        <br />
                        2
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        3
                      </div>

                      <div class="modal-footer">
                        <button class="btn btn-sm btn-danger pull-right" data-dismiss="modal">
                          <i class="ace-icon fa fa-times"></i>
                          Close
                        </button>
                      </div>
                    </div><!-- /.modal-content -->
                  </div><!-- /.modal-dialog -->
                </div>

                <div id="aside-inside-modal" class="modal" data-placement="bottom" data-background="true" data-backdrop="false" tabindex="-1">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-body">
                        <div class="row">
                          <div class="col-xs-12 white">
                            <h3 class="lighter no-margin">Inside another modal</h3>

                            <br />
                            <br />
                          </div>
                        </div>
                      </div>
                    </div><!-- /.modal-content -->

                    <button class="btn btn-default btn-app btn-xs ace-settings-btn aside-trigger" data-target="#aside-inside-modal" data-toggle="modal" type="button">
                      <i data-icon2="fa-arrow-down" data-icon1="fa-arrow-up" class="ace-icon fa fa-arrow-up bigger-110 icon-only"></i>
                    </button>
                  </div><!-- /.modal-dialog -->
                </div>
  </div>
                
  <!-- Main -->
  <div id="main">
    <section class="wrapper">
      <div class="inner">
        <header class="align-center">
          <h2>Indoor Environment Management</h2>
          <p>매장의 실내환경 정보입니다. 자동 및 수동 제어가 가능합니다.</p>
        </header>
      </div>
    </section>

    <section class="wrapper style1">
      <div class="inner">
        <div class="row">
          <div class="3u 12u$(medium)">
            <div class="box">
              <p align="center">
                <strong>김수빈</strong> 님 반갑습니다.
              </p>
              <a href="${pageContext.servletContext.contextPath}/loginmain.html" class="button special">로그인 페이지 이동</a>
              <a href="#" class="button alt">로그 아웃</a>
            </div>
            <div class="box">
              <ul class="actions vertical">
                <li><a href="${pageContext.servletContext.contextPath}/dmb_menu.html" class="button">메뉴보드</a></li>
                <li><a href="${pageContext.servletContext.contextPath}/dmb_event.html" class="button">이벤트보드</a></li>
                <li><a href="${pageContext.servletContext.contextPath}/iot_control.html" class="button">실내 환경</a></li>
                <li><a href="${pageContext.servletContext.contextPath}/store_management.html" class="button">매장관리 처음으로 이동</a></li>
                <li><a href="${pageContext.servletContext.contextPath}/mypage.html" class="button">마이페이지로 이동</a></li>
              </ul>
            </div>
          </div>
          <div class="9u$ 12u$(medium)">
            <div class="box">
              <div class="flex flex-3">
                <div class="col align-center">
                  <div class="image round fit">
                    <img src="${pageContext.servletContext.contextPath}/images/temp02.jpg" alt="" />
                  </div>
                  <div class="panel-group">
                    <div class="panel panel-default">
                      <div class="panel-heading">
                        <h4 class="panel-title">
                          <!-- AWSIoT에 들어간 실내 온도 값-->
                          <a data-toggle="collapse" href="#collapse1">현재온도 : ${message.temperature} °C<br></a>
                        </h4>
                      </div>
                      <div id="collapse1" class="panel-collapse collapse">
                        <ul class="list-group">
                          <li class="list-group-item">기기 전원상태
                          <label>
                            <input name="switch-field-1" class="ace ace-switch ace-switch-3" type="checkbox" />
                            <span class="lbl"></span>
                          </label></li>
                          <li class="list-group-item">Auto Setting 활성
                          <label>
                            <input name="switch-field-2" class="ace ace-switch ace-switch-2" type="checkbox" />
                            <span class="lbl"></span>
                          </label></li>
                          <li class="list-group-item">Auto Setting 설정온도 : 18도</li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <a href="#my-modal" class="button" role="button" data-toggle="modal">온도관리</a>
                </div>
                
                
                <div class="col align-center">
                  <div class="image round fit">
                    <img src="${pageContext.servletContext.contextPath}/images/clean.jpg" alt="" />
                  </div>
                  <div class="panel-group">
                    <div class="panel panel-default">
                      <div class="panel-heading">
                        <h4 class="panel-title">
                          <!-- AWSIoT에 들어간 실내 습도 값-->
                          <a data-toggle="collapse" href="#collapse2">현재습도 : ${message.humidity} %<br></a>
                        </h4>
                      </div>
                      <div id="collapse2" class="panel-collapse collapse">
                        <ul class="list-group">
                          <li class="list-group-item">기기 전원상태
                          <label>
                            <input name="switch-field-3" class="ace ace-switch ace-switch-3" type="checkbox" />
                            <span class="lbl"></span>
                          </label></li>
                          <li class="list-group-item">Auto Setting 활성
                          <label>
                            <input name="switch-field-4" class="ace ace-switch ace-switch-2" type="checkbox" />
                            <span class="lbl"></span>
                          </label></li>
                          <li class="list-group-item">Auto Setting 설정습도 : 50%</li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <a href="#" class="button">습도관리</a>
                </div>
                
                <div class="col align-center">
                  <div class="image round fit">
                    <img src="${pageContext.servletContext.contextPath}/images/fine_dust01.jpg" alt="" />
                  </div>
                  <div class="panel-group">
                    <div class="panel panel-default">
                      <div class="panel-heading">
                        <h4 class="panel-title">
                            <!-- AWSIoT에 들어간 실내 미세먼지 값-->
                          <a data-toggle="collapse" href="#collapse3">현재 실내 미세먼지: ${message.dustDensityug} [ug/m3]<br></a>
                        </h4>
                      </div>
                      <div id="collapse3" class="panel-collapse collapse">
                        <ul class="list-group">
                          <li class="list-group-item">현재 상태 : 나쁨</li>
                          <li class="list-group-item">기기 전원상태
                          <label>
                            <input name="switch-field-5" class="ace ace-switch ace-switch-3" type="checkbox" />
                            <span class="lbl"></span>
                          </label></li>
                          <li class="list-group-item">Auto Setting 활성
                          <label>
                            <input name="switch-field-6" class="ace ace-switch ace-switch-2" type="checkbox" />
                            <span class="lbl"></span>
                          </label></li>
                          <li class="list-group-item">Auto Setting 설정 미세먼지 : 10μg/m3</li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <a href="#" class="button">미세먼지관리</a>
                </div>
              </div>

            </div>
          </div>
        </div>
      </div>
    </section>
  </div>

  <!-- 5초 간격으로 새로고침 -->
<script>
setInterval(function() {
  location.reload();
}, 5000);
</script>


  <!-- Footer -->
  <footer id="footer">
    <div class="copyright">
      <ul class="icons">
        <li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
        <li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
        <li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
        <li><a href="#" class="icon fa-github"><span class="label">Github</span></a></li>
      </ul>
      <p>&copy; Untitled. All rights reserved. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Unsplash</a>.</p>
    </div>
  </footer>
  
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
  <script src="${pageContext.servletContext.contextPath}/assets/js/bootstrap.min.js"></script>
  <script src="${pageContext.servletContext.contextPath}/assets/js/ace-elements.min.js"></script>
  <script src="${pageContext.servletContext.contextPath}/assets/js/ace.min.js"></script>
  <script src="${pageContext.servletContext.contextPath}/assets/js/jquery.scrolly.min.js"></script>
  <script src="${pageContext.servletContext.contextPath}/assets/js/skel.min.js"></script>
  <script src="${pageContext.servletContext.contextPath}/assets/js/util.js"></script>
  <script src="${pageContext.servletContext.contextPath}/assets/js/main.js"></script>
  <script type="text/javascript">
      jQuery(function($) {
        $('.modal.aside').ace_aside();
        
        $('#aside-inside-modal').addClass('aside').ace_aside({container: '#my-modal > .modal-dialog'});
        
        //$('#top-menu').modal('show')
        
        $(document).one('ajaxloadstart.page', function(e) {
          //in ajax mode, remove before leaving page
          $('.modal.aside').remove();
          $(window).off('.aside')
        });
        
        
        //make content sliders resizable using jQuery UI (you should include jquery ui files)
        //$('#right-menu > .modal-dialog').resizable({handles: "w", grid: [ 20, 0 ], minWidth: 200, maxWidth: 600});
      })
    </script>
</body>
</html>