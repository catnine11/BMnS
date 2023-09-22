////  var IMP = window.IMP; 
////    IMP.init("imp46250334"); 
////    function requestPay(isLogin) {
////        
////        // 로그인 체크
////        if (!isLogin) {
////            alert("로그인 후 이용할 수 있습니다.");
////            return;
////        }
////
////
////        // 값 세팅
////        getCurrentUserInfo();
////        let temp = getMerchantUid_setPrice();
////        let merchant_uid = temp.merchant_uid;
////        let pay_auth_id = temp.pay_auth_id;
////        let amount = temp.price;
////        
////
////        // 결제창 호출 코드
////        IMP.request_pay({ // 파라미터
////            pg: "kakao", // pg사
////            pay_method: "kakaopay", // 결제 수단
////            merchant_uid: merchant_uid, //주문번호
////            name: name,  //결제창에서 보여질 이름
////            amount: amount,  //가격 
////            buyer_name: buyer_name,// 구매자 이름
////            buyer_tel: buyer_tel, // 구매자 전화번호
////        }, function (rsp) { 
////            if (rsp.success) { // 결제 성공
////
////                $.ajax({
////                    headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
////                    url: "/pay/complete",
////                    method: "POST",
////                    dataType : "JSON",
////                    data: {
////                        imp_uid: rsp.imp_uid,
////                        merchant_uid: rsp.merchant_uid,
////                        pay_auth_id : pay_auth_id,
////                        goods_id : goods_id,
////                    },
////                    success: function(data) {
////                        if(data.result.code!=200){
////                            //결제실패(웹서버측 실패)   
////                            // 환불 코드(아직 구현 안함)
////                            alert("위조된 결제 시도에 의해 결제에 실패했습니다.");  
////                            removePayAuth(pay_auth_id);// pay_auth 값 지우기
////                        }else{
////                            //결제성공(웹서버측 성공)
////                            alert("결제에 성공했습니다.");
////                        }
////                    },
////                    error: function(data) {
////                        console.log("error" +data);
////                    }
////                });
////            } else {
////                removePayAuth(pay_auth_id); // pay_auth 값 지우기
////                alert("결제에 실패했습니다. : " +  rsp.error_msg);
////            }
////        });
////    }
////    
////    // 현재 사용자의 정보를 가져오는 함수
////    function getCurrentUserInfo() {
////        $.ajax({
////            headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
////            url: "/users/getCurrentUser",
////            type: "get",
////            async:false, // 동기방식(전역변수에 값 저장하려면 필요)
////            dataType : "json",
////            success : function(data) {
////                buyer_name = data.name;
////                buyer_tel = data.tel;
////            },
////            error: function(request,status,error){ 
////                alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); 
////                console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
////            }
////        });
////    }
////    
////	// 주문번호를 가져오는 함수 
////    function getMerchantUid_setPrice() {
////        var result = "";
////        $.ajax({
////            headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
////            url: "/pay/getMerchantUidAndSetPrice",
////            type: "GET",
////            async:false, // 동기방식(전역변수에 값 저장하려면 필요)
////            dataType: "json",
////            data : {
////                goods_id : goods_id
////            },
////            success : function(data) {
////                result = data;
////            },
////            error: function(request,status,error){ 
////                alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); 
////                console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
////                result = "error";
////            }
////        });
////        return result;
////    }
////
////    function removePayAuth(removePayAuthId) {
////        $.ajax({
////            headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
////            url: "/pay/removePayAuth",
////            method: "POST",
////            dataType : "text",
////            data: {
////                removePayAuthId : removePayAuthId
////            },
////            success: function() {
////                
////            },
////            error: function(request, status, error) {
////                console.log("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
////            }
////        });
////    }
//	var merchant_uid = merchant_uid + 1;
//		var point = 10000; 
//		var IMP = window.IMP;
//		var loginVo = document.getElementById("loginVo");
//		IMP.init("imp46250334");
//	console.log("유저정보",loginVo);
//
//        function requestPay() {
//            IMP.request_pay(
//                {
//                    pg: "kakaopay", 
//                    pay_method: "card", 
//                    merchant_uid: merchant_uid,
//                    name: "결제테스트",
//                    amount: point,
//                    buyer_email: loginVo,
//                    buyer_name: loginVo,
//                    buyer_tel: loginVo,
//                    buyer_addr: loginVo,
//                    buyer_postcode: loginVo,
//                },
//                function (rsp) {
//                    console.log(rsp);
//
//                    if (rsp.success) {
//                        var msg = '결제가 완료되었습니다.';
//                        msg += '고유ID : ' + rsp.imp_uid;
//                        msg += '거래ID : ' + rsp.merchant_uid;
//                        msg += '결제 금액 : ' + rsp.paid_amount;
//                        msg += '카드 승인번호 : ' + rsp.apply_num;
//                        alert(msg);
//
//                        $.ajax({
//                            type: "POST",
//                            url: "./payForm.do",
//                            data: JSON.stringify ({
//                                point: point,
//                                pay_method:pay_method
//                            }),
//                            contentType: "application/json",
//                            success: function(data) {
//                                console.log('ajax success');
//                            },
//                            error: function(xhr, status, error) {
//                                console.log('ajax error:', error);
//                            }
//                        });
//                    } else {
//                        var msg = '결제에 실패하였습니다.';
//                        msg += '에러내용 : ' + rsp.error_msg;
//                        console.log('결제실패');
//                        alert(msg);
//                    }
//                }
//            );
//        }