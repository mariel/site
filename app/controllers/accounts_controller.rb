class AccountsController < ApplicationController
    def create
        @account = Account.new(account_params)

        if @account.save
            redirect_to @account
        else 
            render 'new'
        end
    end
    
    def destroy
        @account = Account.find(params[:id])
        @account.destroy

        redirect_to welcome_index_url
    end

    def edit
        @account = Account.find(params[:id])
    end

    def index
        @accounts = Account.all
    end

    def new
        @account = Account.new
    end
    
    def show
        if Account.any? 
            @account = Account.find(params[:id])
        else
            render 'noAccounts'
        end
    end

    def update
        @account = Account.find(params[:id])

        if @account.update(account_params)
            redirect_to @account
        else
            render 'edit'
        end
    end

    def login
        @account = Account.find(params[:id])
        render 'edit'
    end
    private
        def account_params
            params.require(:account).permit(:username, :password)
        end
end
