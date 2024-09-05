<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>테스트 샘플 파일</title>
</head>
<style>
	#app *{
		margin: 8px;
		border-radius: 3px;
	}
</style>
<body>
	<div id="app">
			<div>
				제품 명 : 
				<input type="text" placeholder="새로운거" v-model="name"> 
			</div>
			<div>
				제품 가격 : 
				<input type="number" placeholder="가격" v-model="price"> 
			</div>
			<button @click="fnSave()">저장</button>

	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				productNo: null,
				name: null,
				price: null
            };
        },
        methods: {
			fnSave(){
				var self = this;
				var nparmap = {
					name : self.name,
					price: self.price
				};
				$.ajax({
					url:"insert.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						alert(data.message);
						if(data.result){
							location.href="/test.do";

						}

					}
				});
            }
        },
        mounted() {
			
        }
    });
    app.mount('#app');
</script>
​