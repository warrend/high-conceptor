$(function(){
	bindClickHandlers();
	User.templateSource = $('#show-template').html();
	User.template = Handlebars.compile(User.templateSource);
})

function User(attr){
	this.name = attr.name
	this.email = attr.email
	this.id = attr.id
	this.bio = attr.bio
	this.averageRating = attr.average_rating
	this.loglines = attr.loglines
	//this.averageRating = attr.average_rating
}

User.prototype.renderShow = function(){
	return User.template(this)
}

const bindClickHandlers = function(){
	var templateFormSource = $('#form-template').html();
	var formTemplate = Handlebars.compile(templateFormSource);

	$('.user-show').on('click', function(e){
		e.preventDefault();
		$.get(this.href).done(function(response){
			var user = new User(response);
			var showPage = user.renderShow();

			history.pushState(null, null, "users/" + response.id)
			$('#content').html(showPage);
			console.log(response)
		})
	})

	$(document).on('click', '.button', function(e){
		var loglineId = $(this).parent().data("id")
		$(this).parent().html(formTemplate({id: loglineId}))
	})

	$(document).on('submit', '#new_rating', function(e){
		e.preventDefault()
		$.post(this.action, $(this).serialize()).done(function(data){
			$('.rate-form-' + data.logline_id).html("Your rating: " + data.rating + "/100")			
		})
	})

	$(document).on('click', '#next', function(e){
		e.preventDefault()
		var userId = parseInt($(this).parent().data("user-id")) + 1

		$.get('/users/' + userId).done(function(response){
			history.pushState(null, null, "/users/" + response.id)
			var user = new User(response);
			var showPage = user.renderShow();
			$('#content').html(showPage);
		}).fail(function(){
			console.log("This user doesn't exist.")
		})
	})
}




