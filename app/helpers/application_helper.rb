module ApplicationHelper
    def full_title(page_title='')
        base_title='一GO!'
        if page_title.empty?
            base_title
        else
            page_title+" | "+base_title
        end
    end
    
    def user_page_button(current_name='', current_id=0)
        base_name='Anonymous'
        if(current_name.empty?)
            base_name+" "+current_id.to_s
        else
            current_name
        end
    end
end
