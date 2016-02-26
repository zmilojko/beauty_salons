class MailchimpsubscribeController < ApplicationController

  def index
  end

  def subscribe
    email = params[:email][:address]
    if !email.blank?
    begin
    @mailchimp.lists.subscribe(@list_id, {:email => email, :double_optin => false})
    respond_to do |format|
    format.json{render :json => {:message => '<div class="alert alert-success alert-dismissible"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Čestitamo!</strong><br> Vaša adresa je uspešno dodata na mailing listu. Molimo proverite svoj email zbog potvrde.</div>'}}
    end

    rescue Mailchimp::ListAlreadySubscribedError
    respond_to do |format|
    format.json{render :json => {:message => '<div class="alert alert-danger alert-dismissible"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+email+' je već na našoj listi.</div>'}}
    end

    rescue Mailchimp::ListDoesNotExistError
    respond_to do |format|
    format.json{render :json => {:message => '<div class="alert alert-danger alert-dismissible"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>Lista nije pronađena.</div>'}}
    end

    rescue Mailchimp::Error => ex
    if ex.message
    respond_to do |format|
    format.json{render :json => {:message => '<div class="alert alert-danger alert-dismissible"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>Došlo je do greške. Molimo unesite ispravnu email adresu.</div>'}}
    end
    else
    respond_to do |format|
    format.json{render :json => {:message => '<div class="alert alert-danger alert-dismissible"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> Došlo je do greške. Molimo pokušajte kasnije.</div>'}}
    end
    end
    end
    else
    respond_to do |format|
    format.json{render :json => {:message => '<div class="alert alert-danger alert-dismissible"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> Email adresa ne može biti prazna. Molimo unesite ispravnu email adresu.</div>'}}
    end
    end
  end

end
