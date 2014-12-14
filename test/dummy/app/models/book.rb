class Book < ActiveRecord::Base 
 # config authority for admin_user                              #__admin:resource:authority__
 # adds method: creatable_by?(user), etc                        #__admin:resource:authority__
 # Edit config/initializers/authority.rb.                       #__admin:resource:authority__
 # That file documents all your options,                        #__admin:resource:authority__
 # but one of particular interest is config.abilities,          #__admin:resource:authority__
 # which defines the verbs and corresponding adjectives         #__admin:resource:authority__
 # in your app.                                                 #__admin:resource:authority__
 #                                                              #__admin:resource:authority__
 # This option determines what methods are added to your users, #__admin:resource:authority__
 # models and authorizers.                                      #__admin:resource:authority__
 # If you need to ask user.can_deactivate?(Satellite)           #__admin:resource:authority__
 # and                @satellite.deactivatable_by?(user)        #__admin:resource:authority__
 #                                                              #__admin:resource:authority__
 # add :deactivate => 'deactivatable' to the hash.              #__admin:resource:authority__
 # =>                                                           #__admin:resource:authority__
 # The defaults are:                                            #__admin:resource:authority__
 #  config.abilities =  {                                       #__admin:resource:authority__
 #   :create => 'creatable',                                    #__admin:resource:authority__
 #   :read   => 'readable',                                     #__admin:resource:authority__
 #   :update => 'updatable',                                    #__admin:resource:authority__
 #   :delete => 'deletable'                                     #__admin:resource:authority__
 # }                                                            #__admin:resource:authority__
 #                                                              #__admin:resource:authority__
 include Authority::Abilities                                   #__admin:resource:authority__
 # Set authorizer class to Admin::UserAuthorizer                #__admin:resource:authority__
 self.authorizer_name = 'UserAuthorizer'                        #__admin:resource:authority__

end
