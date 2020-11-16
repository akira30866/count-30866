class Category < ActiveHash::Base
  self.data = [
    {id:1, name: '--'},
    {id:2, name: '経済'},
    {id:3, name: '地域'},
    {id:4, name: 'エンタメ'},
    {id:5, name: 'グルメ'}
  ]

  include ActiveHash::Associations
  has_many :counts
end
