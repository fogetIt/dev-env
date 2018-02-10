
**社区版没有tomcat配置功能**

### 配置JDK：
- File----Project Structure: project SDK---New a jdk.

### 安装Maven插件：
- File----Settings...----Plugins----Maven Integration
- File----Settings...----Build,Execution,Deployment----Build Tools----Maven----Maven home directory----填写Tomcat安装路径

### 配置Tomcat
1. File----Settings...----Build,Execution,Deployment----Application Servers-->点击"+"号，选择"Tomcat Server"----选中tomcat 的地址，点击OK。
2. Defaults----TomcatServer----点击"+"号----Server tab页，修改Name ,Applicaton server 下拉框选择刚才配置的Tomcat应用服务器。
3. Deployment目录选择要部署的web应用`注意：此处一定要选到WebContent文件夹，即WEB-INF上的上一级目录`----点击OK，并配置应用的上下文路径。
4. 修改编译输出路径：工程----右键----Open Module Settings----选择Paths tab页，将output path:配置到WEB-INF\classes中，否则会找不到类。
5. 启动tomcat。

### 建立web项目
- File----New----Project...----Maven。
- Next，填写GroupId，ArtifactId（同项目名）和Version。
- Next，填写项目名称和module名称。
- 点击Finish。

### 引用外部jar包
File----Project Structure----Modules----Dependencies----Add...----Library...----Attach Classes。

添加tomcat的依赖是为了满足servlet和jsp依赖的，tomcat作为一个servlet容器提高了servlet和jsp的API。

### 单元测试————建立mian方法