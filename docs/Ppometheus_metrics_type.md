#### Counter
计数器是一个累积量度，代表一个单调递增的计数器，其值只能在重新启动时增加或重置为零。 例如，您可以使用计数器来表示已处理请求，已完成任务或错误的数量。
#### Gauge
Gauge是一种度量标准，代表可以任意上下波动的单个数值。通常用于测量值，例如温度或当前的内存使用量，还用于可能上升和下降的“计数”，例如并发请求数。
#### Histogram
直方图对观察值（通常是请求持续时间或响应大小之类的东西）进行采样，并将其计数在可配置的存储桶中。 它还提供所有观察值的总和。
- 示例
```
nginx_log_http_response_time_seconds_hist_bucket{method="GET",service="nginx_test_service",status="405",upstream_addr="10.191.2.171:8024",le="0.005"} 18551
nginx_log_http_response_time_seconds_hist_bucket{method="GET",service="nginx_test_service",status="405",upstream_addr="10.191.2.171:8024",le="0.01"} 18614
nginx_log_http_response_time_seconds_hist_bucket{method="GET",service="nginx_test_service",status="405",upstream_addr="10.191.2.171:8024",le="0.025"} 18616
nginx_log_http_response_time_seconds_hist_bucket{method="GET",service="nginx_test_service",status="405",upstream_addr="10.191.2.171:8024",le="0.05"} 18619
nginx_log_http_response_time_seconds_hist_bucket{method="GET",service="nginx_test_service",status="405",upstream_addr="10.191.2.171:8024",le="0.1"} 18628
nginx_log_http_response_time_seconds_hist_bucket{method="GET",service="nginx_test_service",status="405",upstream_addr="10.191.2.171:8024",le="0.25"} 18634
nginx_log_http_response_time_seconds_hist_bucket{method="GET",service="nginx_test_service",status="405",upstream_addr="10.191.2.171:8024",le="0.5"} 18634
nginx_log_http_response_time_seconds_hist_bucket{method="GET",service="nginx_test_service",status="405",upstream_addr="10.191.2.171:8024",le="1"} 18634
nginx_log_http_response_time_seconds_hist_bucket{method="GET",service="nginx_test_service",status="405",upstream_addr="10.191.2.171:8024",le="2.5"} 18634
nginx_log_http_response_time_seconds_hist_bucket{method="GET",service="nginx_test_service",status="405",upstream_addr="10.191.2.171:8024",le="5"} 18635
nginx_log_http_response_time_seconds_hist_bucket{method="GET",service="nginx_test_service",status="405",upstream_addr="10.191.2.171:8024",le="10"} 18635
nginx_log_http_response_time_seconds_hist_bucket{method="GET",service="nginx_test_service",status="405",upstream_addr="10.191.2.171:8024",le="+Inf"} 18635
nginx_log_http_response_time_seconds_hist_sum{method="GET",service="nginx_test_service",status="405",upstream_addr="10.191.2.171:8024"} 47.625000000006324
nginx_log_http_response_time_seconds_hist_count{method="GET",service="nginx_test_service",status="405",upstream_addr="10.191.2.171:8024"} 18635
```
上面的数据展示的是某个时间点nginx_test_service服务的统计情况，其中请求的总数量为18635(nginx_log_http_response_time_seconds_hist_count对应的值)，请求总的耗时为47.625000000006324s(nginx_log_http_response_time_seconds_hist_sum对应的值)，每个bucket对应的为某一个区间的请求数量，
```nginx_log_http_response_time_seconds_hist_bucket{method="GET",service="nginx_test_service",status="405",upstream_addr="10.191.2.171:8024",le="0.005"} 18551 ```表示请求耗时小于等于0.005s的请求数量为18551，其他可以类推。

#### Summary
类似于直方图，Summary会采样观察结果（通常是请求持续时间和响应大小之类的东西）。 尽管它还提供了观测值的总数和所有观测值的总和，但它可以计算滑动时间窗口内的可配置分位数。
- 示例
```
nginx_log_http_response_time_seconds{method="POST",service="nginx_test_service_v2",status="200",upstream_addr="10.191.2.170:8033",quantile="0.5"} 0.161
nginx_log_http_response_time_seconds{method="POST",service="nginx_test_service_v2",status="200",upstream_addr="10.191.2.170:8033",quantile="0.9"} 0.247
nginx_log_http_response_time_seconds{method="POST",service="nginx_test_service_v2",status="200",upstream_addr="10.191.2.170:8033",quantile="0.99"} 0.35
nginx_log_http_response_time_seconds_sum{method="POST",service="nginx_test_service_v2",status="200",upstream_addr="10.191.2.170:8033"} 52611.560999999776
nginx_log_http_response_time_seconds_count{method="POST",service="nginx_test_service_v2",status="200",upstream_addr="10.191.2.170:8033"} 278036
```
上面的数据展示的是某个时间点nginx_test_service_v2服务的统计情况，其中请求的总数量为278036(nginx_log_http_response_time_seconds_count对应的值)，请求总的耗时为52611.560999999776s(nginx_log_http_response_time_seconds_sum对应的值), **quantile="0.5"}**表示耗时小于0.161s的请求数占总数的50%，**quantile="0.9"} 0.247**表示耗时小于0.247s的请求数占总数的90%

#### Reference
[https://prometheus.io/docs/concepts/metric_types/](https://prometheus.io/docs/concepts/metric_types/)