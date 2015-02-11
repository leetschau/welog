
 # Created by ruiyun_zhou on 2/8/15.
 
Template.layout.events
	'click #showProfileMenu':  (event, t)->
		t.ActionSheetButtons = []
			
		if Meteor.user()?
			t.ActionSheetButtons.push {actionId:'addpost', text: 'New Post <i class="icon ion-ios-compose"></i>'}
			t.ActionSheetButtons.push {actionId:'logout', text: 'Logout <i class="icon ion-log-out"></i>'}
		else
			t.ActionSheetButtons.push {actionId:'login', text: 'Login <i class="icon ion-log-in"></i>'}


		IonActionSheet.show 
			titleText: ''
			buttons: t.ActionSheetButtons
	
			cancelText: 'Cancel'
			cancel: -> 
			buttonClicked: (index)->
				switch t.ActionSheetButtons[index]?.actionId
					when 'addpost' then Router.go 'addpost'
					when 'logout' 
						Meteor.logout ->
							toastr.success 'Logged out'
							Router.go 'lists'
					when 'login'
						Router.go 'userAccounts'
				return true
			
			destructiveButtonClicked: ->
				console.log('Destructive Action!');
				return true
