module Api
	module V1
		class SchedulesController < ApplicationController
			def index
				# api/v1/buniesses/business_id/schedules
				@schedule = Business.find(params[:business_id]).schedule

				render json: @schedule
			end

			def show
				#api/v1/buniesses/id
				@schedule = Schedule.find(params[:id])

				render json: @schedule
			end

			def create
				# /api/v1/businesses/:business_id/schedules
				@schedule = Schedule.new(schedules_params)
				if @schedule.save
					render json: @schedule, status: :created
				else
					render json: @schedule.errors, status: :unprocessable_entity
				end
			end

			private

			def schedules_params
				params.permit(
					:business_id,
					:sundayopen,
					:sundayclose,
					:mondayopen,
					:mondayclose,
					:tuesdayopen,
					:tuesdayclose,
					:wednesdayopen,
					:wednesdayclose,
					:thursdayopen,
					:thursdayclose,
					:fridayopen,
					:fridayclose,
					:saturdayopen,
					:saturdayclose
				)
			end
		end
	end
end
