module Spree
  class SaleImage < Asset
    module Configuration
      module ActiveStorage
        extend ActiveSupport::Concern

        included do
          validate :check_attachment_presence
          validate :check_attachment_content_type

          has_one_attached :attachment

          def self.styles
            @styles ||= {
              mini: '240v60>',
              small: '400x100>',
              medium: '600x150'
            }
          end

          def self.mobile_styles
            self.styles.slice(:mini, :small, :large)
          end

          def default_style
            :small
          end

          def accepted_image_types
            %w(image/jpeg image/jpg image/png image/gif)
          end

          def check_attachment_presence
            unless attachment.attached?
              errors.add(:attachment, :attachment_must_be_present)
            end
          end

          def check_attachment_content_type
            if attachment.attached? && !attachment.content_type.in?(accepted_image_types)
              errors.add(:attachment, :not_allowed_content_type)
            end
          end
        end
      end
    end
  end
end
