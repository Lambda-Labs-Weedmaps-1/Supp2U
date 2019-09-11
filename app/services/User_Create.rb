class UserCreate < ApplicationService
    def self.call(args, block)
        new(args, block).execute
    end

    def initialize(user)
        @user = user
    end

    def execute
        if @user.save
            status: :created 
        else
            status: :unprocessable_entity
        end
    end
end