var User = Backbone.Model.extend({
	url: "/users",

	events: {
		user.on("invalid",function(model,error){
			alert(error);
		});
	},

	validate: function(attrs,options){
		if(attrs.name === ''){ 
			return "Name cannot be blank";
		} else if(attrs.email === ''){
			return "Email address required";
		} else if(attrs.password === ''){
			return "Password required";
		} else if(attrs.password_confirmation === '')
			return "Password confirmation required";
		} else if (attrs.password_confirmation !== attrs.password_confirmation){
			return "Password and passwordconfirmation must match";
		}
	},

	onSuccess: function(model, response, options){
		console.log(response);
	},

	onError: function(){
		console.log("error");
	},

});


// //create user instance
// var user = new User();

// //save data to backend
// user.save({name:"Jimmy",age:"12",gender:"male"},{success:onSuccess,error:onError});