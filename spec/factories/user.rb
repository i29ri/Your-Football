FactoryBot.define do
  factory :user do
    yourfoot_ID { Faker::Lorem.characters(number:10) }
    nickname { Faker::Lorem.characters(number:30) }
  end
end

# t.string "email", default: "", null: false
#     t.string "encrypted_password", default: "", null: false
#     t.string "reset_password_token"
#     t.datetime "reset_password_sent_at"
#     t.datetime "remember_created_at"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.string "yourfoot_ID"
#     t.string "nickname"
#     t.string "profile_image_id"
#     t.text "introduction"
#     t.boolean "is_deleted", default: false
#     t.boolean "admin", default: false
#     t.boolean "admin_flg"
#     t.index ["email"], name: "index_users_on_email", unique: true
#     t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
#   end