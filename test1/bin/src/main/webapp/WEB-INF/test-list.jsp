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
		<input type="number" placeholder="1~15 입력(pk값)" v-model="productNo"> 
		<button @click="fnGetList()">검색</button>
		<div v-if="result != null">
			<div>
				제품 번호 : {{productNo}}
			</div>
			<div>
				제품 명 : {{name}}
			</div>
			<div>
				제품 가격 : 
				<span v-if="price != null">
				 	{{price}}
				 </span>
				 <span v-else>
 				 	<input type="number" placeholder="가격입력" v-model="newPrice">
					<button @click="fnSave()">저장</button>
 				 </span>
			</div>
				
			<button @click="fnModify()">수정</button>
			<button @click="fnRemove()">삭제</button>
		</div>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				productNo: null,
				result: null,
				name: null,
				price: null,
				newPrice: null
            };
        },
        methods: {
			
            fnGetList(){
				var self = this;
				var nparmap = {productNo : self.productNo};
				$.ajax({
					url:"test.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						if(data.result){
							self.name = data.test.productName;
							self.price = data.test.productPrice;
							self.result = data.result;
						}
					}
				});
            },
			fnModify(){
				var self = this;
				self.price = null;
			},
			fnSave(){
				var self = this;
				var nparmap = {
					productNo : self.productNo,
					newPrice : self.newPrice
					
				};
				$.ajax({
					url:"modify.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						alert(data.message);
						if(data.result){
							self.fnGetList();
						}

					}
				});
            },
			fnRemove(){
				var self = this;
				var nparmap = {productNo : self.productNo};
				$.ajax({
					url:"remove.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						alert(data.message);
						if(data.result){
							self.name = null;
							self.price = null;
							self.result = null;
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