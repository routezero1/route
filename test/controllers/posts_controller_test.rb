require 'test_helper'

class PostsControllerTest < ActionController::TestCase
    include Devise::Test::ControllerHelpers
    
    test "index action should be success" do
        get :index
        assert_response :success
    end
    
    test "new action should be success" do
        get :new
        assert_response :success        
    end
    
    test "show should be success" do
        post = posts(:one)
        
        get :show, id: post.id
        assert_response :success   
    end

    test "should get home" do
        get :index
        assert_response :success
        
        assert_template layout: 'application'
        
        assert_select 'title', 'Route'
        assert_select 'p', "Share your inspiration or see what's inspiring others."
    end
    
    test "should get contact" do
        get :contact
        assert_response:success
        assert_template layout: 'application'
        assert_select'title', 'My Notes'
        assert_select'h1', 'Contact Us'
        assert_select'p', 'Complete the following form to get in touch with us.'
    end
    
    test "should post request contact but no email" do
        post :request_contact
        
        assert_response:redirect
        assert_not_empty flash[:alert]
        assert_nil flash[:notice]
    end
    
    test "should post request contact" do
        post :request_contact,
        name: "Aras", email: "aa01558@surrey.ac.uk",
        telephone: "1234567890", message: "Hello"
        
        assert_response:redirect
        assert_nil flash[:alert]
        assert_not_empty flash[:notice]
    end
    # tired to long and too many different ways to get this to work, i'll just leave it here.
end
