$(function(){
	bindClickHandlers();
	User.templateSource = $('#show-template').html();
	User.template = Handlebars.compile(User.templateSource);
})

function User(attr){
	this.name = attr.name
	this.id = attr.id
	this.bio = attr.bio
	this.averageRating = attr.average_rating
	this.loglines = attr.loglines
	//this.averageRating = attr.average_rating
}


// User.prototype.renderShow = function(){
// 	return User.template(this)
// }

const bindClickHandlers = function(){
	$('.user-show').on('click', function(e){
		e.preventDefault();
		$.get(this.href).done(function(response){
			var user = new User(response);
			var showPage = User.template(user);
			
			$('#content').html(showPage);
			console.log(response)
		})
	})
}

