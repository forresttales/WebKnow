# == Schema Information
#
# Table name: publishers
#
#  id              :integer          not null, primary key
#  created_at      :datetime
#  updated_at      :datetime
#  user_id         :integer
#  zip             :string(255)
#  slug            :string(255)
#  name_company    :string(255)
#  address1        :string(255)
#  address2        :string(255)
#  website         :string(255)
#  phone_company   :string(255)
#  email_info      :string(255)
#  email_admin     :string(255)
#  name_admin      :string(255)
#  tagline_logo    :string(255)
#  city            :string(255)
#  state           :string(255)
#  country         :string(255)
#  story_corporate :text             default("")
#  id_gen          :integer
#  id_per          :string(255)      default("")
#  id_per_b        :boolean          default(FALSE)
#  slug_pre_id     :string(255)      default("")
#

class PublicPublisher < Publisher
end
