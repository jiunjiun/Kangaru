# encoding: utf-8
namespace :line do
  desc "Update Visitor"
  task :update_visitor => :environment do
    Adapter.includes(:visitors).where(adaptable_type: 'AdapterLine').each do |adapter|
      adapter.visitors.each do |visitor|
        company = visitor.company
        uid     = visitor.identifier.split('_').last
        profile = Line::Profile.get company, uid

        visitor.name   = profile['displayName']
        visitor.avatar = profile['pictureUrl']
        visitor.save
      end
    end
  end
end
