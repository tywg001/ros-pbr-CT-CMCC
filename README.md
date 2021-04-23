电信联通移动 策略路由规则

ip段信息取自 https://bgp.space/

每日凌晨2点自动更新于此（如有更新）。

策略路由分流有两种实现方法：

方法一：
**ros-pbr-CT-UN-CM.rsc** 是往route - rules 里生ip段列表。

ros script 例子

```
/file remove [find name="ros-pbr-CT-UN-CM.rsc"]
/ip route rule remove [find table=main]
/ip route rule remove [find table=CT]
/ip route rule remove [find table=UN]
/ip route rule remove [find table=CM]
/tool fetch url="https://github.com/tywg001/ros-pbr-CT-CMCC/blob/master/ros-pbr-CT-CMCC.rsc"
/import ros-pbr-CT-UN-CM.rsc
```

方法二：
**ros-dpbr-CT-UN-CM.rsc** 是往Firewall - address lists 里生ip段列表。

这个可以用于Firewall - mangle页，通过dst-addrss= 引用


方法二会更灵活点。

ros-pbr-CN.sh是生成全大陆的IP表，用作专线和普通宽带分流用
