class NotifyMailer < ApplicationMailer

    def notify_resident
        @resident_email = params[:resident_email]
        @visitor = params[:visitor]
        mail(
            to:  @resident_email,
            subject: @visitor.name+ " has come to meet you!" ,
            body: @visitor.name + " has checked in to your premises at " + @visitor.check_in.in_time_zone("Kolkata").strftime("%I:%M %p %m-%d-%y")  + " for the purpose of " + @visitor.reason
            ) 
    end
end
