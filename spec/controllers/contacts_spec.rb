require 'rails_helper'

class Hash
  def json(parts)
    ary = parts.split(">")
    ary.reduce(self) do |memo, key|
      memo.fetch(key.to_s.strip) if memo
    end
  end
end

describe ContactsController, type: :controller do

  it 'training test success' do
    contact = Contact.first
    
    request.accept = 'application/vnd.api+json'
    get :show, params: { id: contact.id }

    response_body = JSON.parse(response.body)
    
    expect(response_body.json('data > attributes > email')).to eq(contact.email)
  end

  it 'request index and returned 200 ok' do
    request.accept = 'application/vnd.api+json'
    get :index
    
    expect(response).to have_http_status(:ok)
  end

  it 'GET /contacts/:id' do
    contact = Contact.first

    request.accept = 'application/vnd.api+json'
    get :show, params: {id: contact.id}

    response_body = JSON.parse(response.body)

    expect(response_body.fetch('data').fetch('id')).to eq(contact.id.to_s)
    expect(response_body.json('data > type')).to eq('contacts')
    expect(response_body.json('data > attributes > name')).to eq(contact.name)
  end

end