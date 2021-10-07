class GraphqlChannel < ApplicationCable::Channel
  def subscribed
    @subscription_ids ||= []
  end

  def execute(data)
    result = GraphqlSecondDemoSchema.execute(
      query: data["query"],
      context: {
        channel: self
      },
      variables: data["variables"],
      operation_name: data["operationName"]
    )

    payload = {
      result: result.subscription? ? { data: nil } : result.to_h,
      more: result.subscription?
    }

    @subscription_ids << result.context[:subscription_id] if result.context[:subscription_id]

    transmit(payload)
  end

  def unsubscribed
    @subscription_ids.each do |sid|
      GraphqlSecondDemoSchema.subscriptions.delete_subscription(sid)
    end
  end
end
