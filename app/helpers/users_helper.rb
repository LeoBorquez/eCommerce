module UsersHelper

  #Return the Gravatar for the given user
  def gravatar_for(user, options = { size:80 } )
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase) #I’ve used the downcase method to ensure that the argument to hexdigest is all lowercase.
    size = options[:size]
    gravatar_url =  "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

end
