<!--ts-->
   * [Spring IoC总览](#spring-ioc总览)
      * [Spring IoC 依赖查找](#spring-ioc-依赖查找)
      * [Spring IoC 依赖注入](#spring-ioc-依赖注入)
      * [Spring IoC 依赖来源](#spring-ioc-依赖来源)
      * [Spring IoC 配置元信息](#spring-ioc-配置元信息)
      * [Spring IoC 容器问题](#spring-ioc-容器问题)
      * [Spring 应用上下文](#spring-应用上下文)
   * [Spring Bean 基础](#spring-bean-基础)
      * [定义 Spring Bean](#定义-spring-bean)
         * [什么是 BeanDefinition?](#什么是-beandefinition)
      * [BeanDefinition 元信息](#beandefinition-元信息)
         * [BeanDefinition 元信息](#beandefinition-元信息-1)
            * [BeanDefinition 构建](#beandefinition-构建)
      * [命名Spring Bean](#命名spring-bean)
         * [Bean的名称](#bean的名称)
            * [Bean 名称生成器（BeanNameGenerator）](#bean-名称生成器beannamegenerator)
         * [Spring Bean 的别名](#spring-bean-的别名)
            * [Bean 别名（Alias）的价值](#bean-别名alias的价值)
      * [注册Spring Bean](#注册spring-bean)
         * [BeanDefinition 注册](#beandefinition-注册)
         * [外部单例对象注册](#外部单例对象注册)
      * [实例化Spring Bean](#实例化spring-bean)
         * [Bean 实例化（Instantiation）](#bean-实例化instantiation)
      * [初始化Spring Bean](#初始化spring-bean)
         * [Bean 初始化（Initialization）](#bean-初始化initialization)
         * [延迟初始化Spring Bean](#延迟初始化spring-bean)
            * [Bean 延迟初始化（Lazy Initialization）](#bean-延迟初始化lazy-initialization)
      * [销毁Spring Bean](#销毁spring-bean)
         * [Bean 销毁（Destroy）](#bean-销毁destroy)
      * [垃圾回收Spring Bean](#垃圾回收spring-bean)
         * [Bean 垃圾回收（GC）](#bean-垃圾回收gc)
   * [Spring 依赖查找](#spring-依赖查找)
      * [传统依赖查找](#传统依赖查找)
      * [单一类型依赖查找](#单一类型依赖查找)
         * [单一类型依赖查找接口-BeanFactory](#单一类型依赖查找接口-beanfactory)
      * [集合类型依赖查找](#集合类型依赖查找)
         * [集合类型依赖查找接口-ListableBeanFactory](#集合类型依赖查找接口-listablebeanfactory)
      * [层次性依赖查找](#层次性依赖查找)
         * [层次性依赖查找接口-HierarchicalBeanFactory](#层次性依赖查找接口-hierarchicalbeanfactory)
      * [延迟依赖查找](#延迟依赖查找)
      * [内建可查找的依赖](#内建可查找的依赖)
         * [AbstractApplicationContext 内建可查找的依赖](#abstractapplicationcontext-内建可查找的依赖)
         * [注解驱动Spring 应用上下文内建可查找的依赖](#注解驱动spring-应用上下文内建可查找的依赖)
   * [依赖注入](#依赖注入)
      * [依赖注入的模式和类型](#依赖注入的模式和类型)
      * [自动绑定（Autowiring）](#自动绑定autowiring)
         * [Autowiring modes](#autowiring-modes)
      * [Setter 方法注入](#setter-方法注入)
      * [构造器注入](#构造器注入)
      * [字段注入](#字段注入)
      * [方法注入](#方法注入)
      * [接口回调注入](#接口回调注入)
         * [Aware系列接口回调](#aware系列接口回调)
      * [依赖注入类型选择](#依赖注入类型选择)
      * [基础类型注入](#基础类型注入)
      * [集合类型注入](#集合类型注入)
      * [限定注入](#限定注入)
      * [延迟依赖注入](#延迟依赖注入)
      * [依赖处理过程](#依赖处理过程)
         * [基础](#基础)
      * [@Autowired 注入](#autowired-注入)
         * [@Autowired 注入规则](#autowired-注入规则)
         * [@Autowired 注入过程](#autowired-注入过程)
      * [@Inject 注入](#inject-注入)
         * [@Inject 注入过程](#inject-注入过程)
      * [Java通用注解注入原理](#java通用注解注入原理)
         * [CommonAnnotationBeanPostProcessor](#commonannotationbeanpostprocessor)
   * [依赖来源](#依赖来源)
      * [依赖查找来源](#依赖查找来源)
         * [查找来源](#查找来源)
         * [Spring 内建 BeanDefintion](#spring-内建-beandefintion)
         * [Spring 內建单例对象](#spring-內建单例对象)
      * [依赖注入的来源](#依赖注入的来源)
         * [注入来源](#注入来源)
      * [Spring容器管理和游离对象](#spring容器管理和游离对象)
      * [Spring BeanDefinition 作为依赖来源](#spring-beandefinition-作为依赖来源)
      * [单例对象作为依赖来源](#单例对象作为依赖来源)
      * [非Spring 容器管理对象作为依赖来源](#非spring-容器管理对象作为依赖来源)
      * [外部化配置作为依赖来源 (@Value)](#外部化配置作为依赖来源-value)
   * [Spring Bean 作用域](#spring-bean-作用域)
      * [作用域](#作用域)
      * ["prototype" Bean作用域](#prototype-bean作用域)
      * [Singleton 和Prototype区别](#singleton-和prototype区别)
      * ["request" Bean作用域](#request-bean作用域)
      * ["session" Bean作用域](#session-bean作用域)
      * ["application" Bean作用域](#application-bean作用域)
      * [自定义Bean 作用域](#自定义bean-作用域)
   * [Spring Bean 生命周期](#spring-bean-生命周期)
      * [Spring Bean 元信息配置阶段](#spring-bean-元信息配置阶段)
      * [Spring Bean 元信息解析阶段](#spring-bean-元信息解析阶段)
      * [Spring Bean 注册阶段](#spring-bean-注册阶段)
      * [Spring BeanDefinition 合并阶段](#spring-beandefinition-合并阶段)
      * [Spring Bean Class 加载阶段](#spring-bean-class-加载阶段)
         * [AbstractBeanFactory#resolveBeanClass](#abstractbeanfactoryresolvebeanclass)
      * [Spring Bean 实例化前阶段](#spring-bean-实例化前阶段)
         * [AbstractAutowireCapableBeanFactory#resolveBeforeInstantiation](#abstractautowirecapablebeanfactoryresolvebeforeinstantiation)
      * [Spring Bean 实例化阶段](#spring-bean-实例化阶段)
         * [AbstractAutowireCapableBeanFactory#createBeanInstance](#abstractautowirecapablebeanfactorycreatebeaninstance)
      * [Spring Bean 实例化后阶段](#spring-bean-实例化后阶段)
         * [AbstractAutowireCapableBeanFactory#populateBean](#abstractautowirecapablebeanfactorypopulatebean)
      * [Spring Bean 属性赋值前阶段](#spring-bean-属性赋值前阶段)
         * [AbstractAutowireCapableBeanFactory#populateBean](#abstractautowirecapablebeanfactorypopulatebean-1)
      * [Spring Bean Aware接口回调阶段](#spring-bean-aware接口回调阶段)
         * [AbstractAutowireCapableBeanFactory#initializeBean](#abstractautowirecapablebeanfactoryinitializebean)
         * [ApplicationContextAwareProcessor#postProcessBeforeInitialization](#applicationcontextawareprocessorpostprocessbeforeinitialization)
      * [Spring Bean 初始化前阶段 总结](#spring-bean-初始化前阶段-总结)
         * [AbstractAutowireCapableBeanFactory#initializeBean](#abstractautowirecapablebeanfactoryinitializebean-1)
      * [Spring Bean 初始化阶段](#spring-bean-初始化阶段)
      * [Spring Bean 初始化后阶段](#spring-bean-初始化后阶段)
      * [Spring Bean 初始化完成阶段](#spring-bean-初始化完成阶段)
      * [Spring Bean 销毁前阶段](#spring-bean-销毁前阶段)
      * [Spring Bean 销毁阶段](#spring-bean-销毁阶段)
      * [BeanFactory 是怎样处理Bean 生命周期 总结](#beanfactory-是怎样处理bean-生命周期-总结)
   * [Spring配置元信息](#spring配置元信息)
      * [Spring Bean 配置元信息](#spring-bean-配置元信息)
      * [Spring Bean 属性元信息](#spring-bean-属性元信息)
      * [Spring 容器配置元信息](#spring-容器配置元信息)
         * [Spring XML 配置元信息-beans 元素相关](#spring-xml-配置元信息-beans-元素相关)
         * [SpringXML配置元信息-应用上下文相关](#springxml配置元信息-应用上下文相关)
      * [基于XML资源装载SpringBean配置元信息](#基于xml资源装载springbean配置元信息)
      * [基于Properties资源装载SpringBean配置元信息](#基于properties资源装载springbean配置元信息)
      * [基于Java注解装载SpringBean配置元信息](#基于java注解装载springbean配置元信息)
         * [Spring模式注解](#spring模式注解)
         * [Spring Bean定义注解](#spring-bean定义注解)
      * [Spring Bean依赖注入注解](#spring-bean依赖注入注解)
      * [Spring Bean条件装配注解](#spring-bean条件装配注解)
      * [Spring Bean生命周期回调注解](#spring-bean生命周期回调注解)
      * [SpringBean配置元信息底层实现](#springbean配置元信息底层实现)
         * [Spring XML 资源 BeanDefinition解析与注册](#spring-xml-资源-beandefinition解析与注册)
         * [Spring Properties 资源BeanDefinition解析与注册](#spring-properties-资源beandefinition解析与注册)
         * [Spring Java  config 注册 BeanDefinition解析与注册](#spring-java--config-注册-beandefinition解析与注册)
      * [基于XML资源装载Spring IoC容器配置元信息](#基于xml资源装载spring-ioc容器配置元信息)
         * [Spring IoC容器相关XML配置](#spring-ioc容器相关xml配置)
         * [Spring IoC容器装配注解](#spring-ioc容器装配注解)
         * [Spring IoC配属属性注解](#spring-ioc配属属性注解)
      * [基于Properties资源装载外部化配](#基于properties资源装载外部化配)
      * [基于 YAML资源装载外部化配置](#基于-yaml资源装载外部化配置)
   * [Spring 资源管理（Resources）](#spring-资源管理resources)
      * [Java 标准资源管理](#java-标准资源管理)
         * [Java 标准资源定位](#java-标准资源定位)
         * [Java URL 协议扩展](#java-url-协议扩展)
         * [基于java.net.URLStreamHandler 扩展协议](#基于javaneturlstreamhandler-扩展协议)
      * [Spring 资源接口](#spring-资源接口)
      * [Spring 内建Resource 实现](#spring-内建resource-实现)
      * [Spring Resource 接口扩展](#spring-resource-接口扩展)
      * [Spring 资源加载器](#spring-资源加载器)
      * [Spring 通配路径资源加载器](#spring-通配路径资源加载器)
         * [通配路径ResourceLoader](#通配路径resourceloader)
         * [路径匹配器](#路径匹配器)
      * [Spring 通配路径资源扩展](#spring-通配路径资源扩展)
   * [Spring Boot 独立应用启动](#spring-boot-独立应用启动)
      * [FAT JAR和WAR执行模块-----Spring-boot-loader](#fat-jar和war执行模块-----spring-boot-loader)
   * [Spring Boot 生命周期](#spring-boot-生命周期)
      * [SpringApplication初始化阶段](#springapplication初始化阶段)
         * [SpringApplication 构造阶段](#springapplication-构造阶段)
            * [推断Weby应用类型](#推断weby应用类型)
            * [加载Spring应用上下文初始化器](#加载spring应用上下文初始化器)
            * [加载Spring应用事件监听器](#加载spring应用事件监听器)
            * [推断应用引导类](#推断应用引导类)
      * [SpringApplication运行阶段](#springapplication运行阶段)
         * [SpringApplication准备阶段](#springapplication准备阶段)
            * [SpringApplicationRunListeners获取以及实例化](#springapplicationrunlisteners获取以及实例化)
            * [准备ConfigurableEnviroment](#准备configurableenviroment)
            * [创建Spring应用上下文（ConfigurableApplicationContext）](#创建spring应用上下文configurableapplicationcontext)
            * [Spring应用上下文运行前准备](#spring应用上下文运行前准备)
               * [spring应用上下文准备阶段](#spring应用上下文准备阶段)
               * [spring应用上下文装载阶段](#spring应用上下文装载阶段)
         * [Spring 应用上下文启动阶段](#spring-应用上下文启动阶段)
            * [Spring IoC 容器生命周期](#spring-ioc-容器生命周期)
         * [Spring应用上下文启动后阶段](#spring应用上下文启动后阶段)
      * [SpringApplication结束阶段](#springapplication结束阶段)
   * [Spring MVC](#spring-mvc)

<!-- Added by: ahaschool, at: 2021年 8月20日 星期五 14时18分01秒 CST -->

<!--te-->

# Spring IoC总览

## Spring IoC 依赖查找

- 根据 Bean 名称查找 
  - 实时查找
  
    ```java
    User user = beanFactory.getBean("user");
    User user = beanFactory.getBean(User.class);
    ```
  
  - 延迟查找
  
    ```java
    ObjectFactory<User> objectFactory = (ObjectFactory<User>)beanFactory.getBean("objectFactory");
    User user = objectFactory.getObject();
    ```
- 根据 Bean 类型查找
  - 单个 Bean 对象
  
  - 集合 Bean 对象
  
    ```java
    Map<String,User> map = beanfactory.getBeansOfType(User.class);
    ```
  
- 根据 Bean 名称 + 类型查找

- 根据 Java 注解查找
  - 单个 Bean 对象
  - 集合 Bean 对象

## Spring IoC 依赖注入

- 根据 Bean 名称注入
- 根据 Bean 类型注入
  - 单个 Bean 对象
  - 集合 Bean 对象
- 注入容器內建 Bean 对象
- 注入非 Bean 对象
- 注入类型
  -  实时注入 
  - 延迟注入

## Spring IoC 依赖来源

- 自定义 Bean
- 容器內建 Bean 对象 
- 容器內建依赖
  - BeanFactory
  - Environment

## Spring IoC 配置元信息

- Bean 定义配置 
  - 基于 XML 文件
  - 基于 Properties 文件
  - 基于 Java 注解
  - 基于 Java API

- IoC 容器配置
  - 基于 XML 文件
  - 基于 Java 注解
  - 基于 Java API 
- 外部化属性配置
  -  基于 Java 注解

## Spring IoC 容器问题

- BeanFactory 和 ApplicationContext 谁才是 Spring IoC 容器?
  - BeanFactory 和 ApplicationContext 都是spring IOC 容器，BeanFactory 是 Spring 底层 IoC 容器，ApplicationContext是BeanFactory的子接口，提供更多企业级的功能。

## Spring 应用上下文

- ApplicationContext 除了 IoC 容器角色，还有提供:
  - 面向切面(AOP)

  - 配置元信息(Configuration Metadata)

  - 资源管理(Resources)

  - 事件(Events)

  - 国际化(i18n)

  - 注解(Annotations)

  - Environment 抽象(Environment Abstraction)

    https://docs.spring.io/spring/docs/5.2.2.RELEASE/spring-framework-reference/core.html#beans-introduction

# Spring Bean 基础


## 定义 Spring Bean

### 什么是 BeanDefinition?

- BeanDefinition 是 Spring Framework 中定义 Bean 的配置元信息接口，包含:
  - Bean 的类名
  - Bean 行为配置元素，如作用域、自动绑定的模式，生命周期回调等
  - 其他 Bean 引用，又可称作合作者(collaborators)或者依赖(dependencies)
  - 配置设置，比如 Bean 属性(Properties)

## BeanDefinition 元信息

### BeanDefinition 元信息

| 属性(Property) | 说明 |
| ------------- | ---- |
| Class | Bean 全类名，必须是具体类，不能用抽象类或接口 |
| Name | Bean 的名称或者 ID |
| Scope | Bean 的作用域(如:singleton、prototype 等) |
| Constructor arguments | Bean 构造器参数(用于依赖注入) |
| Properties | Bean 属性设置(用于依赖注入) |
| Autowiring mode | Bean 自动绑定模式(如:通过名称 byName) |
| Lazy initialization mode | Bean 延迟初始化模式(延迟和非延迟) |
| Initialization method | Bean 初始化回调方法名称 |
| Destruction method | Bean 销毁回调方法名称 |

####  BeanDefinition 构建

- 通过 BeanDefinitionBuilder

```java
// 1.通过 BeanDefinitionBuilder 构建
BeanDefinitionBuilder beanDefinitionBuilder = BeanDefinitionBuilder.genericBeanDefinition(User.class);
// 通过属性设置
beanDefinitionBuilder
  .addPropertyValue("id", 1)
  .addPropertyValue("name", "小马哥");
// 获取 BeanDefinition 实例
BeanDefinition beanDefinition = beanDefinitionBuilder.getBeanDefinition();
// BeanDefinition 并非 Bean 终态，可以自定义修改
```

- 通过 AbstractBeanDefinition 以及派生类

```java
// 2. 通过 AbstractBeanDefinition 以及派生类
GenericBeanDefinition genericBeanDefinition = new GenericBeanDefinition();
// 设置 Bean 类型
genericBeanDefinition.setBeanClass(User.class);
// 通过 MutablePropertyValues 批量操作属性
MutablePropertyValues propertyValues = new MutablePropertyValues();
//        propertyValues.addPropertyValue("id", 1);
//        propertyValues.addPropertyValue("name", "小马哥");
propertyValues
  .add("id", 1)
  .add("name", "小马哥");
// 通过 set MutablePropertyValues 批量操作属性
genericBeanDefinition.setPropertyValues(propertyValues);
```

## 命名Spring Bean

### Bean的名称

每个Bean 拥有一个或多个标识符（identifiers），这些标识符在Bean 所在的容器必须是唯一的。通常，一个Bean 仅有一个标识符，如果需要额外的，可考虑使用别名（Alias）来扩充。

在基于XML 的配置元信息中，开发人员可用id 或者name 属性来规定Bean 的标识符。通常Bean 的标识符由字母组成，允许出现特殊字符。如果要想引入Bean 的别名的话，可在name 属性使用半角逗号（“,”）或分号（“;”) 来间隔。

Bean 的id 或name 属性并非必须制定，如果留空的话，容器会为Bean 自动生成一个唯一的名称。Bean 的命名尽管没有限制，不过官方建议采用驼峰的方式，更符合Java 的命名约定。

#### Bean 名称生成器（BeanNameGenerator）

- 由Spring Framework 2.0.3 引入，框架內建两种实现：DefaultBeanNameGenerator：默认通用BeanNameGenerator 实现

```java
	@Override
	public String generateBeanName(BeanDefinition definition, BeanDefinitionRegistry registry) {
		return BeanDefinitionReaderUtils.generateBeanName(definition, registry);
	}

	public static String generateBeanName(
			BeanDefinition definition, BeanDefinitionRegistry registry, boolean isInnerBean)
			throws BeanDefinitionStoreException {

		String generatedBeanName = definition.getBeanClassName();
		if (generatedBeanName == null) {
			if (definition.getParentName() != null) {
				generatedBeanName = definition.getParentName() + "$child";
			}
			else if (definition.getFactoryBeanName() != null) {
				generatedBeanName = definition.getFactoryBeanName() + "$created";
			}
		}
		if (!StringUtils.hasText(generatedBeanName)) {
			throw new BeanDefinitionStoreException("Unnamed bean definition specifies neither " +
					"'class' nor 'parent' nor 'factory-bean' - can't generate bean name");
		}

		String id = generatedBeanName;
		if (isInnerBean) {
			// Inner bean: generate identity hashcode suffix.
			id = generatedBeanName + GENERATED_BEAN_NAME_SEPARATOR + ObjectUtils.getIdentityHexString(definition);
		}
		else {
			// Top-level bean: use plain class name with unique suffix if necessary.
			return uniqueBeanName(generatedBeanName, registry);
		}
		return id;
	}
```



- AnnotationBeanNameGenerator：基于注解扫描的BeanNameGenerator 实现，起始于Spring Framework 2.5

```java
public String generateBeanName(BeanDefinition definition, BeanDefinitionRegistry registry) {
		if (definition instanceof AnnotatedBeanDefinition) {
			String beanName = determineBeanNameFromAnnotation((AnnotatedBeanDefinition) definition);
			if (StringUtils.hasText(beanName)) {
				// Explicit bean name found.
				return beanName;
			}
		}
		// Fallback: generate a unique default bean name.
		return buildDefaultBeanName(definition, registry); // 默认走老的
	}
@Nullable
protected String determineBeanNameFromAnnotation(AnnotatedBeanDefinition annotatedDef) {
  AnnotationMetadata amd = annotatedDef.getMetadata();
  Set<String> types = amd.getAnnotationTypes();
  String beanName = null;
  for (String type : types) {
    AnnotationAttributes attributes = AnnotationConfigUtils.attributesFor(amd, type);
    if (attributes != null && isStereotypeWithNameValue(type, amd.getMetaAnnotationTypes(type), attributes)) {
      Object value = attributes.get("value");
      if (value instanceof String) {
        String strVal = (String) value;
        if (StringUtils.hasLength(strVal)) {
          if (beanName != null && !strVal.equals(beanName)) {
            throw new IllegalStateException("Stereotype annotations suggest inconsistent " +
                                            "component names: '" + beanName + "' versus '" + strVal + "'");
          }
          beanName = strVal;
        }
      }
    }
  }
  return beanName;
}
```

### Spring Bean 的别名

#### Bean 别名（Alias）的价值

- 复用现有的BeanDefinition
- 更具有场景化的命名方法

## 注册Spring Bean

### BeanDefinition 注册

- XML 配置元信息
  - <bean name=”...” ... />
- Java 注解配置元信息
  - `@Bean`
  - `@Component`
  - `@Import`
- Java API 配置元信息
  - 命名方式：`BeanDefinitionRegistry#registerBeanDefinition(String,BeanDefinition)`
  - 非命名方式：`BeanDefinitionReaderUtils#registerWithGeneratedName(AbstractBeanDefinition,BeanDefinitionRegistry)`
  - 配置类方式：`AnnotatedBeanDefinitionReader#register(Class...)`

### 外部单例对象注册

- Java API 配置元信息
  - `SingletonBeanRegister#registerSigleton`

## 实例化Spring Bean

### Bean 实例化（Instantiation）

- 常规方式

  - 通过构造器（配置元信息：XML、Java 注解和Java API ）

  - 通过静态工厂方法（配置元信息：XML 和Java API ）

    ```java
    <bean id="user-by-static-method" class="org.geekbang.thinking.in.spring.ioc.overview.domain.User"
              factory-method="createUser"/>
    
      public static User createUser() {
            User user = new User();
            user.setId(1L);
            user.setName("小马哥");
            return user;
    }
    ```

    

  - 通过Bean 工厂方法（配置元信息：XML和Java API ）

  ```java
  <bean id="userFactory" class="org.geekbang.thinking.in.spring.bean.factory.DefaultUserFactory"/>
   public interface UserFactory {
  
      default User createUser() {
          return User.createUser();
      }
  }
  ```

  

  - 通过FactoryBean（配置元信息：XML、Java 注解和Java API ）

  ```java
  <bean id="user-by-factory-bean" class="org.geekbang.thinking.in.spring.bean.factory.UserFactoryBean" />
   public class UserFactoryBean implements FactoryBean {
  
      @Override
      public Object getObject() throws Exception {
          return User.createUser();
      }
  
      @Override
      public Class<?> getObjectType() {
          return User.class;
      }
  }
  ```

  

- 特殊方式

  - 通过`ServiceLoaderFactoryBean`（配置元信息：XML、Java 注解和Java API ）

    ```java
    <bean id="userFactoryServiceLoader" class="org.springframework.beans.factory.serviceloader.ServiceLoaderFactoryBean">
            <property name="serviceType" value="org.geekbang.thinking.in.spring.bean.factory.UserFactory" />
        </bean>
      
    ServiceLoader<UserFactory> serviceLoader = beanFactory.getBean("userFactoryServiceLoader", ServiceLoader.class);
    ```

  - 通过`AutowireCapableBeanFactory#createBean(java.lang.Class, int, boolean)`

    ```java
    UserFactory userFactory = autowireCapableBeanFactory.createBean(DefaultUserFactory.class);
    
    ```

  - 通过`BeanDefinitionRegistry#registerBeanDefinition(String,BeanDefinition)`

## 初始化Spring Bean

### Bean 初始化（Initialization）

- `@PostConstruct` 标注方法**（1）**
- 实现`InitializingBean` 接口的`afterPropertiesSet()` 方法**（2）**
- 自定义初始化方法**（3）**
  - XML 配置：`<bean init-method=”init” ... /> `
  - Java 注解：`@Bean(initMethod=”init”)`
  - Java API：`AbstractBeanDefinition#setInitMethodName(String)`

### 延迟初始化Spring Bean

#### Bean 延迟初始化（Lazy Initialization）

- XML 配置：`<bean lazy-init=”true” ... />`
- Java 注解：`@Lazy(true)`

## 销毁Spring Bean

### Bean 销毁（Destroy）

- `@PreDestroy` 标注方法**（1）**
- 实现`DisposableBean` 接口的`destroy()` 方法**（2）**
- 自定义销毁方法**（3）**
  - XML 配置：`<bean destroy=”destroy” ... />` 
  - Java 注解：`@Bean(destroy=”destroy”)`
  - Java API：`AbstractBeanDefinition#setDestroyMethodName(String)`

## 垃圾回收Spring Bean

### Bean 垃圾回收（GC）

- 1.关闭Spring 容器（应用上下文）
- 2.执行GC
- 3.Spring Bean 覆盖的finalize() 方法被回调

# Spring 依赖查找

## 传统依赖查找

- 单一类型查找
  - JNDI - `javax.naming.Context#lookup(javax.name.Name)`
  - JavaBeans - `java.beans.beancontext.BeanContext`
- 集合类型查找
  - `java.beans.beancontext.BeanContext`
- 层次性查找
  - `java.beans.beancontext.BeanContext`

## 单一类型依赖查找

### 单一类型依赖查找接口-BeanFactory

- 根据Bean名称查找
  - `getBean(String)`
  - Spring2.5覆盖默认参数：`getBean(String,Object...)`
- 根据Bean 类型查找
  - Bean 实时查找
    - Spring 3.0 `getBean(Class)`
    - Spring 4.1 覆盖默认参数：`getBean(Class,Object...)`
  - Spring 5.1  Bean 延迟查找
    - `getBeanProvider(Class)`
    - `getBeanProvider(ResolvableType)`
  - 根据Bean 名称+ 类型查找：`getBean(String,Class)`

## 集合类型依赖查找

### 集合类型依赖查找接口-ListableBeanFactory

- 根据Bean 类型查找
  - 获取同类型Bean 名称列表
    - `getBeanNamesForType(Class)`
    - Spring 4.2 `getBeanNamesForType(ResolvableType)`
  - 获取同类型Bean 实例列表
    - `getBeansOfType(Class)` 以及重载方法
- 通过注解类型查找
  - Spring 3.0 获取标注类型Bean 名称列表
    - `getBeanNamesForAnnotation(Class<? extends Annotation>)`
  - Spring 3.0 获取标注类型Bean 实例列表
    - `getBeansWithAnnotation(Class<? extends Annotation>)`
  - Spring 3.0 获取指定名称+ 标注类型Bean 实例
    - `findAnnotationOnBean(String,Class<? extends Annotation>)`

## 层次性依赖查找

### 层次性依赖查找接口-HierarchicalBeanFactory

- 双亲BeanFactory：`getParentBeanFactory()`
  - 层次性查找
    - 根据Bean 名称查找
      - 基于`containsLocalBean` 方法实现
    - 根据Bean 类型查找实例列表
      - 单一类型：`BeanFactoryUtils#beanOfType`
      - 集合类型：`BeanFactoryUtils#beansOfTypeIncludingAncestors`
    - 根据Java 注解查找名称列表
    - `BeanFactoryUtils#beanNamesForTypeIncludingAncestors`

## 延迟依赖查找

- Bean 延迟依赖查找接口
  - `org.springframework.beans.factory.ObjectFactory`
  - `org.springframework.beans.factory.ObjectProvider`
    - Spring 5 对Java 8 特性扩展
      - 函数式接口
        - `getIfAvailable(Supplier)`
        - `ifAvailable(Consumer)`
      - Stream 扩展-`stream()`

## 内建可查找的依赖

### AbstractApplicationContext 内建可查找的依赖

| Bean名称                   | Bean实例                       | 使用场景               |
| -------------------------- | ------------------------------ | ---------------------- |
| environment                | Environment对象                | 外部化配置以及Profiles |
| systemProperties           | java.util.properties对象       | java系统属性           |
| systemEnvionment           | java.util.Map对象              | 操作系统环境变量       |
| messageSource              | MessageSource对象              | 国际化文案             |
| lifecycleProcessor         | LifecycleProcessor对象         | Lifecycle Bean处理器   |
| applicationEventMulticater | ApplicationEventMuticaster对象 | Spring 事件广播器      |

### 注解驱动Spring 应用上下文内建可查找的依赖

| Bean名称                                                     | Bean实例                                    | 使用场景                                             |
| ------------------------------------------------------------ | ------------------------------------------- | ---------------------------------------------------- |
| org.springframework.context.annotation.internalConfigurationAnnotationProcessor | ConfigurationClassPostProcessor对象         | 处理Spring配置类                                     |
| org.springframework.context.annotation.internalAutowiredAnnotationProcessor | AutowiredAnnotationBeanPostProcessor对象    | 处理@Autowired 以及@Value 注解                       |
| org.springframework.context.annotation.internalCommonAnnotationProcessor | CommonAnnotationBeanPostProcessor 对象      | （条件激活）处理JSR-250 注解，如@PostConstruct 等    |
| org.springframework.context.event.internalEventListenerProcessor | EventListenerMethodProcessor 对象           | 处理标注@EventListener 的Spring 事件监听方法         |
| org.springframework.context.event.internalEventListenerFactory | DefaultEventListenerFactory 对象            | @EventListener 事件监听方法适配为ApplicationListener |
| org.springframework.context.annotation.internalPersistenceAnnotationProcessor | PersistenceAnnotationBeanPostProcessor 对象 | （条件激活）处理JPA 注解场景                         |

# 依赖注入

## 依赖注入的模式和类型

- 手动模式-配置或者编程的方式，提前安排注入规则
  - XML 资源配置元信息
  - Java 注解配置元信息
  - API 配置元信息
- 自动模式-实现方提供依赖自动关联的方式，按照內建的注入规则
  - Autowiring（自动绑定）

## 自动绑定（Autowiring）

### Autowiring modes

| 模式        | 说明                                                         |
| ----------- | ------------------------------------------------------------ |
| no          | 默认值，未激活Autowiring，需要手动指定依赖注入对象。         |
| byName      | 根据被注入属性的名称作为Bean 名称进行依赖查找，并将对象设置到该属性。 |
| byType      | 根据被注入属性的类型作为依赖类型进行查找，并将对象设置到该属性。 |
| constructor | 特殊byType 类型，用于构造器参数。                            |

## Setter 方法注入

- 实现方法
  - 手动模式
    - XML 资源配置元信息
    - Java 注解配置元信息
    - API 配置元信息
  - 自动模式
    - byName
    - byType

## 构造器注入

- 实现方法
  - 手动模式
    - XML 资源配置元信息
    - Java 注解配置元信息
    - API 配置元信息
  - 自动模式
    - constructor

## 字段注入

- 实现方法
  - 手动模式
    - Java 注解配置元信息
      - @Autowired
      - @Resource
      - @Inject（可选）

## 方法注入

- 实现方法
  - 手动模式
    - Java 注解配置元信息
      - @Autowired
      - @Resource
      - @Inject（可选）
      - @Bean

## 接口回调注入

### Aware系列接口回调

| 内建接口                           | 说明                                                   |
| ---------------------------------- | ------------------------------------------------------ |
| BeanFactoryAware                   | 获取IoC 容器-BeanFactory                               |
| ApplicationContextAware            | 获取Spring应用上下文 - ApplicationContext对象          |
| EnvironmentAware                   | 获取Environment 对象                                   |
| ResourceLoaderAware                | 获取资源加载器对象-ResourceLoader                      |
| ResourceLoaderBeanClassLoaderAware | 获取加载当前Bean Class 的ClassLoader                   |
| BeanNameAware                      | 获取当前Bean 的名称                                    |
| MessageSourceAware                 | 获取MessageSource 对象，用于Spring 国际化              |
| ApplicationEventPublisherAware     | 获取ApplicationEventPublishAware 对象，用于Spring 事件 |
| EmbeddedValueResolverAware         | 获取StringValueResolver 对象，用于占位符处理           |

## 依赖注入类型选择

- 注入选型
  - 低依赖：构造器注入
  - 多依赖：Setter 方法注入
  - 便利性：字段注入
  - 声明类：方法注入

## 基础类型注入

- 原生类型（Primitive）：boolean、byte、char、short、int、float、long、double
- 标量类型（Scalar）：Number、Character、Boolean、Enum、Locale、Charset、Currency、Properties、UUID
- 常规类型（General）：Object、String、TimeZone、Calendar、Optional 等
- Spring 类型：Resource、InputSource、Formatter 等

## 集合类型注入

- 集合类型
  - 数组类型（Array）：原生类型、标量类型、常规类型、Spring 类型
  - 集合类型（Collection）
    - Collection：List、Set（SortedSet、NavigableSet、EnumSet）
    - Map：Properties

## 限定注入

- 使用注解
  - @Qualifier 限定
    - 通过Bean 名称限定
    - 通过分组限定
  - 基于注解@Qualifier 扩展限定
    - 自定义注解-如Spring Cloud @LoadBalanced

## 延迟依赖注入

- 使用API ObjectFactory 延迟注入
  - 单一类型
  - 集合类型
- 使用API ObjectProvider 延迟注入（推荐）
  - 单一类型
  - 集合类型

## 依赖处理过程

### 基础

- 入口-`DefaultListableBeanFactory#resolveDependency`

```java
public Object resolveDependency(DependencyDescriptor descriptor, String requestingBeanName,
			Set<String> autowiredBeanNames, TypeConverter typeConverter) throws BeansException {

		descriptor.initParameterNameDiscovery(getParameterNameDiscoverer());
		if (javaUtilOptionalClass == descriptor.getDependencyType()) {
			return new OptionalDependencyFactory().createOptionalDependency(descriptor, requestingBeanName);
		}
		else if (ObjectFactory.class == descriptor.getDependencyType() ||
				ObjectProvider.class == descriptor.getDependencyType()) {
			return new DependencyObjectProvider(descriptor, requestingBeanName);
		}
		else if (javaxInjectProviderClass == descriptor.getDependencyType()) {
			return new Jsr330ProviderFactory().createDependencyProvider(descriptor, requestingBeanName);
		}
		else {
			Object result = getAutowireCandidateResolver().getLazyResolutionProxyIfNecessary(
					descriptor, requestingBeanName);
			if (result == null) {
				result = doResolveDependency(descriptor, requestingBeanName, autowiredBeanNames, typeConverter);
			}
			return result;
		}
	}

	public Object doResolveDependency(DependencyDescriptor descriptor, String beanName,
			Set<String> autowiredBeanNames, TypeConverter typeConverter) throws BeansException {

		InjectionPoint previousInjectionPoint = ConstructorResolver.setCurrentInjectionPoint(descriptor);
		try {
			Object shortcut = descriptor.resolveShortcut(this);
			if (shortcut != null) {
				return shortcut;
			}

			Class<?> type = descriptor.getDependencyType();
			Object value = getAutowireCandidateResolver().getSuggestedValue(descriptor);
			if (value != null) {
				if (value instanceof String) {
					String strVal = resolveEmbeddedValue((String) value);
					BeanDefinition bd = (beanName != null && containsBean(beanName) ? getMergedBeanDefinition(beanName) : null);
					value = evaluateBeanDefinitionString(strVal, bd);
				}
				TypeConverter converter = (typeConverter != null ? typeConverter : getTypeConverter());
				return (descriptor.getField() != null ?
						converter.convertIfNecessary(value, type, descriptor.getField()) :
						converter.convertIfNecessary(value, type, descriptor.getMethodParameter()));
			}

			Object multipleBeans = resolveMultipleBeans(descriptor, beanName, autowiredBeanNames, typeConverter);
			if (multipleBeans != null) {
				return multipleBeans;
			}

			Map<String, Object> matchingBeans = findAutowireCandidates(beanName, type, descriptor);
			if (matchingBeans.isEmpty()) {
				if (isRequired(descriptor)) {
					raiseNoMatchingBeanFound(type, descriptor.getResolvableType(), descriptor);
				}
				return null;
			}

			String autowiredBeanName;
			Object instanceCandidate;

			if (matchingBeans.size() > 1) {
				autowiredBeanName = determineAutowireCandidate(matchingBeans, descriptor);
				if (autowiredBeanName == null) {
					if (isRequired(descriptor) || !indicatesMultipleBeans(type)) {
						return descriptor.resolveNotUnique(type, matchingBeans);
					}
					else {
						// In case of an optional Collection/Map, silently ignore a non-unique case:
						// possibly it was meant to be an empty collection of multiple regular beans
						// (before 4.3 in particular when we didn't even look for collection beans).
						return null;
					}
				}
				instanceCandidate = matchingBeans.get(autowiredBeanName);
			}
			else {
				// We have exactly one match.
				Map.Entry<String, Object> entry = matchingBeans.entrySet().iterator().next();
				autowiredBeanName = entry.getKey();
				instanceCandidate = entry.getValue();
			}

			if (autowiredBeanNames != null) {
				autowiredBeanNames.add(autowiredBeanName);
			}
			return (instanceCandidate instanceof Class ?
					descriptor.resolveCandidate(autowiredBeanName, type, this) : instanceCandidate);
		}
		finally {
			ConstructorResolver.setCurrentInjectionPoint(previousInjectionPoint);
		}
	}
	protected String determineAutowireCandidate(Map<String, Object> candidates, DependencyDescriptor descriptor) {
		Class<?> requiredType = descriptor.getDependencyType();
		String primaryCandidate = determinePrimaryCandidate(candidates, requiredType);
		if (primaryCandidate != null) {
			return primaryCandidate;
		}
		String priorityCandidate = determineHighestPriorityCandidate(candidates, requiredType);
		if (priorityCandidate != null) {
			return priorityCandidate;
		}
		// Fallback
		for (Map.Entry<String, Object> entry : candidates.entrySet()) {
			String candidateName = entry.getKey();
			Object beanInstance = entry.getValue();
			if ((beanInstance != null && this.resolvableDependencies.containsValue(beanInstance)) ||
					matchesBeanName(candidateName, descriptor.getDependencyName())) {
				return candidateName;
			}
		}
		return null;
	}
```



- 依赖描述符-`DependencyDescriptor`

```java
public class DependencyDescriptor extends InjectionPoint implements Serializable {

	private final Class<?> declaringClass;

	@Nullable
	private String methodName;

	@Nullable
	private Class<?>[] parameterTypes;

	private int parameterIndex;

	@Nullable
	private String fieldName;

	private final boolean required;

	private final boolean eager;

	private int nestingLevel = 1;

	@Nullable
	private Class<?> containingClass;

	@Nullable 
	private transient volatile ResolvableType resolvableType;

	@Nullable
	private transient volatile TypeDescriptor typeDescriptor;

	.....
    
}
```



- 自定绑定候选对象处理器-`AutowireCandidateResolver`

## @Autowired 注入

### @Autowired 注入规则

- 非静态字段
- 非静态方法
- 构造器

### @Autowired 注入过程

`AutowiredAnnotationBeanPostProcessor.AutowiredFieldElement#inject`

- 元信息解析
- 依赖查找
- 依赖注入（字段、方法）

## @Inject 注入

### @Inject 注入过程

如果JSR-330 存在于ClassPath 中，复用AutowiredAnnotationBeanPostProcessor 实现

## Java通用注解注入原理

### CommonAnnotationBeanPostProcessor

- 注入注解
  - javax.xml.ws.WebServiceRef
  - javax.ejb.EJB
  - javax.annotation.Resource
- 生命周期注解
  - javax.annotation.PostConstruct
  - javax.annotation.PreDestroy

# 依赖来源

## 依赖查找来源

### 查找来源

| 来源                  | 配置元数据                                     |
| --------------------- | ---------------------------------------------- |
| Spring BeanDefinition | `<bean id="user" class="org.geekbang...User">` |
|                       | `@Bean public User user(){...}`                |
|                       | `BeanDefinitionBuilder`                        |
| 单例对象API 实现      | API 实现                                       |

### Spring 内建 BeanDefintion

| Bean 名称                                                    | Bean 实例                                 | 使用场景                                          |
| ------------------------------------------------------------ | ----------------------------------------- | ------------------------------------------------- |
| org.springframework.context.annotation.internalConfigurationAnnotationProcessor | ConfigurationClassPostProcessor 对象      | 处理Spring 配置类                                 |
| org.springframework.context.annotation.internalAutowiredAnnotationProcessor | AutowiredAnnotationBeanPostProcessor 对象 | 处理@Autowired 以及@Value 注解                    |
| org.springframework.context.annotation.internalCommonAnnotationProcessor | CommonAnnotationBeanPostProcessor 对象    | （条件激活）处理JSR-250 注解，如@PostConstruct 等 |
| org.springframework.context.event.internalEventListenerProcessor | EventListenerMethodProcessor 对象         | 处理标注@EventListener 的Spring 事件监听方法      |

### Spring 內建单例对象

| Bean名称                   | Bean实例                       | 使用场景               |
| -------------------------- | ------------------------------ | ---------------------- |
| environment                | Environment对象                | 外部化配置以及Profiles |
| systemProperties           | java.util.properties对象       | java系统属性           |
| systemEnvionment           | java.util.Map对象              | 操作系统环境变量       |
| messageSource              | MessageSource对象              | 国际化文案             |
| lifecycleProcessor         | LifecycleProcessor对象         | Lifecycle Bean处理器   |
| applicationEventMulticater | ApplicationEventMuticaster对象 | Spring 事件广播器      |

## 依赖注入的来源

### 注入来源

| 来源                  | 配置元数据                                     |
| --------------------- | ---------------------------------------------- |
| Spring BeanDefinition | `<bean id="user" class="org.geekbang...User">` |
|                       | `@Bean public User user(){...}`                |
|                       | `BeanDefinitionBuilder`                        |
| 单例对象API 实现      | API 实现                                       |
| 非Spring容器管理对象  |                                                |

## Spring容器管理和游离对象

| 来源                  | Spring Bean对象 | 生命周期管理 | 配置元信息 | 使用场景           |
| --------------------- | --------------- | ------------ | ---------- | ------------------ |
| Spring BeanDefinition | 是              | 是           | 有         | 依赖查找、依赖注入 |
| 单体对象              | 是              | 否           | 无         | 依赖查找、依赖注入 |
| Reolveable Dependency | 否              | 否           | 无         | 依赖注入           |

## Spring BeanDefinition 作为依赖来源

- 要素
  - 元数据：BeanDefinition
  - 注册：BeanDefinitionRegistry#registerBeanDefinition
  - 类型：延迟和非延迟
  - 顺序：Bean 生命周期顺序按照注册顺序

## 单例对象作为依赖来源

- 要素
  - 来源：外部普通Java 对象（不一定是POJO）
  - 注册：`SingletonBeanRegistry#registerSingleton`
- 限制
  - 无生命周期管理
  - 无法实现延迟初始化Bean

## 非Spring 容器管理对象作为依赖来源

- 要素
  - 注册：`ConfigurableListableBeanFactory#registerResolvableDependency`
- 限制
  - 无生命周期管理
  - 无法实现延迟初始化Bean
  - 无法通过依赖查找

## 外部化配置作为依赖来源 (@Value)

- 要素
  - 类型：非常规Spring 对象依赖来
- 限制
  - 无生命周期管理
  - 无法实现延迟初始化Bean
  - 无法通过依赖查找

# Spring Bean 作用域

## 作用域

| 来源        | 说明                                                     |
| ----------- | -------------------------------------------------------- |
| singleton   | 默认Spring Bean 作用域，一个BeanFactory 有且仅有一个实例 |
| prototype   | 原型作用域，每次依赖查找和依赖注入生成新Bean 对象        |
| request     | 将Spring Bean 存储在ServletRequest 上下文中              |
| session     | 将Spring Bean 存储在HttpSession 中                       |
| application | 将Spring Bean 存储在ServletContext 中                    |

## "prototype" Bean作用域

- 注意事项
  - Spring 容器没有办法管理prototype Bean 的完整生命周期，也没有办法记录示例的存在。销毁回调方法将不会执行，可以利用BeanPostProcessor 进行清扫工作

## Singleton 和Prototype区别

- 区别一
  - SingletonBean无论依赖查找还是依赖注入，均为同一个对象
  - Prototype无论依赖查找还是依赖注入，均为生成新对象
- 区别二
  - 如果依赖注入集合类型的对象，Singleton Bean 和Prototype Bean 均会存在一个
  - Prototype Bean 有别于其他地方的依赖注入 Prototype Bean
- 区别三
  - 无论是Singleton 还是Prototype Bean均会执行初始化方法回调
  - 不过Prototype Bean 不会执行销毁方法

## "request" Bean作用域

- 配置
  - `XML -<bean class="..."scope  = "request"/>`
  - Java 注解-`@RequestScope` 或@`Scope(WebApplicationContext.SCOPE_REQUEST)`
- 实现
  - API -`RequestScope`

## "session" Bean作用域

- 配置
  - `XML -<bean class="..."scope  = "session"/>`
  - Java 注解-`@RequestScope` 或`@Scope(WebApplicationContext.SCOPE_REQUEST)`
- 实现
  - API -`SessionScope`

## "application" Bean作用域

- 配置
  - `XML -<bean class="..."scope  = "application"/>`
  - Java 注解-`@ApplicationScope` 或`@Scope(WebApplicationContext.SCOPE_APPLICATION)`

- 实现
  - API -`ApplicationScope`

## 自定义Bean 作用域

- 实现Scope

  - `org.springframework.beans.factory.config.Scope

- 注册Scope

  - API -`org.springframework.beans.factory.config.ConfigurableBeanFactory#registerScope`
  - 配置

  ```xml
  <bean class="org.springframework.beans.factory.config.CustomScopeConfigurer">
      <property name="scopes">
          <map>
              <entry key="...">
              </entry>
          </map>
      </property>
  </bean>
  ```

# Spring Bean 生命周期

## Spring Bean 元信息配置阶段

- BeanDefinition 配置

  - 面向资源

    - XML 配置

    ```java
    BeanFactory beanFactory = new ClassPathXmlApplicationContext("classpath:/META-INF/bean-definitions-context.xml");
    ```

    - Properties 资源配置

    ```java
    DefaultListableBeanFactory beanFactory = new DefaultListableBeanFactory();
    // 实例化基于 Properties 资源 BeanDefinitionReader
    PropertiesBeanDefinitionReader beanDefinitionReader = new PropertiesBeanDefinitionReader(beanFactory);
    ```

  - 面向注解

  - 面向API

## Spring Bean 元信息解析阶段

- 面向资源BeanDefinition 解析

  - `BeanDefinitionReader`
  - XML 解析器-`BeanDefinitionParser`

- 面向注解`BeanDefinition` 解析

  - `AnnotatedBeanDefinitionReader`

  ```java
  DefaultListableBeanFactory beanFactory = new DefaultListableBeanFactory();
  // 基于 Java 注解的 AnnotatedBeanDefinitionReader 的实现
  AnnotatedBeanDefinitionReader beanDefinitionReader = new AnnotatedBeanDefinitionReader(beanFactory);
  // 注册当前类（非 @Component class）
  beanDefinitionReader.register(AnnotatedBeanDefinitionParsingDemo.class);
  ```

## Spring Bean 注册阶段

- BeanDefinition 注册接口

  - BeanDefinitionRegistry

  ```java
  private final Map<String, BeanDefinition> beanDefinitionMap = new ConcurrentHashMap<>(256);
  private volatile List<String> beanDefinitionNames = new ArrayList<>(256);
  
  public void registerBeanDefinition(String beanName, BeanDefinition beanDefinition)
  			throws BeanDefinitionStoreException {
  
  		Assert.hasText(beanName, "Bean name must not be empty");
  		Assert.notNull(beanDefinition, "BeanDefinition must not be null");
  
  		if (beanDefinition instanceof AbstractBeanDefinition) {
  			try {
  				((AbstractBeanDefinition) beanDefinition).validate();
  			}
  			catch (BeanDefinitionValidationException ex) {
  				throw new BeanDefinitionStoreException(beanDefinition.getResourceDescription(), beanName,
  						"Validation of bean definition failed", ex);
  			}
  		}
  
  		BeanDefinition existingDefinition = this.beanDefinitionMap.get(beanName);
  		if (existingDefinition != null) {
  			if (!isAllowBeanDefinitionOverriding()) {
  				throw new BeanDefinitionOverrideException(beanName, beanDefinition, existingDefinition);
  			}
  			else if (existingDefinition.getRole() < beanDefinition.getRole()) {
  				// e.g. was ROLE_APPLICATION, now overriding with ROLE_SUPPORT or ROLE_INFRASTRUCTURE
  				if (logger.isInfoEnabled()) {
  					logger.info("Overriding user-defined bean definition for bean '" + beanName +
  							"' with a framework-generated bean definition: replacing [" +
  							existingDefinition + "] with [" + beanDefinition + "]");
  				}
  			}
  			else if (!beanDefinition.equals(existingDefinition)) {
  				if (logger.isDebugEnabled()) {
  					logger.debug("Overriding bean definition for bean '" + beanName +
  							"' with a different definition: replacing [" + existingDefinition +
  							"] with [" + beanDefinition + "]");
  				}
  			}
  			else {
  				if (logger.isTraceEnabled()) {
  					logger.trace("Overriding bean definition for bean '" + beanName +
  							"' with an equivalent definition: replacing [" + existingDefinition +
  							"] with [" + beanDefinition + "]");
  				}
  			}
  			this.beanDefinitionMap.put(beanName, beanDefinition);
  		}
  		else {
  			if (hasBeanCreationStarted()) {
  				// Cannot modify startup-time collection elements anymore (for stable iteration)
  				synchronized (this.beanDefinitionMap) {
  					this.beanDefinitionMap.put(beanName, beanDefinition);
  					List<String> updatedDefinitions = new ArrayList<>(this.beanDefinitionNames.size() + 1);
  					updatedDefinitions.addAll(this.beanDefinitionNames);
  					updatedDefinitions.add(beanName);
  					this.beanDefinitionNames = updatedDefinitions;
  					removeManualSingletonName(beanName);
  				}
  			}
  			else {
  				// Still in startup registration phase
  				this.beanDefinitionMap.put(beanName, beanDefinition);
  				this.beanDefinitionNames.add(beanName);
  				removeManualSingletonName(beanName);
  			}
  			this.frozenBeanDefinitionNames = null;
  		}
  
  		if (existingDefinition != null || containsSingleton(beanName)) {
  			resetBeanDefinition(beanName);
  		}
  	}
  ```

## Spring BeanDefinition 合并阶段

- BeanDefinition 合并

  `RootBeanDefinition`和`GenericBeanDefinition`

  ```java
  	public BeanDefinition getMergedBeanDefinition(String name) throws BeansException {
  		String beanName = transformedBeanName(name);
  		// Efficiently check whether bean definition exists in this factory.
  		if (!containsBeanDefinition(beanName) && getParentBeanFactory() instanceof ConfigurableBeanFactory) {
  			return ((ConfigurableBeanFactory) getParentBeanFactory()).getMergedBeanDefinition(beanName);
  		}
  		// Resolve merged bean definition locally.
  		return getMergedLocalBeanDefinition(beanName);
  	}
  	protected RootBeanDefinition getMergedBeanDefinition(
  			String beanName, BeanDefinition bd, @Nullable BeanDefinition containingBd)
  			throws BeanDefinitionStoreException {
  
  		synchronized (this.mergedBeanDefinitions) {
  			RootBeanDefinition mbd = null;
  			RootBeanDefinition previous = null;
  
  			// Check with full lock now in order to enforce the same merged instance.
  			if (containingBd == null) {
  				mbd = this.mergedBeanDefinitions.get(beanName);
  			}
  
  			if (mbd == null || mbd.stale) {
  				previous = mbd;
  				if (bd.getParentName() == null) {
  					// Use copy of given root bean definition.
  					if (bd instanceof RootBeanDefinition) {
  						mbd = ((RootBeanDefinition) bd).cloneBeanDefinition();
  					}
  					else {
  						mbd = new RootBeanDefinition(bd);
  					}
  				}
  				else {
  					// Child bean definition: needs to be merged with parent.
  					BeanDefinition pbd;
  					try {
  						String parentBeanName = transformedBeanName(bd.getParentName());
  						if (!beanName.equals(parentBeanName)) {
  							pbd = getMergedBeanDefinition(parentBeanName);
  						}
  						else {
  							BeanFactory parent = getParentBeanFactory();
  							if (parent instanceof ConfigurableBeanFactory) {
  								pbd = ((ConfigurableBeanFactory) parent).getMergedBeanDefinition(parentBeanName);
  							}
  							else {
  								throw new NoSuchBeanDefinitionException(parentBeanName,
  										"Parent name '" + parentBeanName + "' is equal to bean name '" + beanName +
  										"': cannot be resolved without an AbstractBeanFactory parent");
  							}
  						}
  					}
  					catch (NoSuchBeanDefinitionException ex) {
  						throw new BeanDefinitionStoreException(bd.getResourceDescription(), beanName,
  								"Could not resolve parent bean definition '" + bd.getParentName() + "'", ex);
  					}
  					// Deep copy with overridden values.
  					mbd = new RootBeanDefinition(pbd);
  					mbd.overrideFrom(bd);
  				}
  
  				// Set default singleton scope, if not configured before.
  				if (!StringUtils.hasLength(mbd.getScope())) {
  					mbd.setScope(SCOPE_SINGLETON);
  				}
  
  				// A bean contained in a non-singleton bean cannot be a singleton itself.
  				// Let's correct this on the fly here, since this might be the result of
  				// parent-child merging for the outer bean, in which case the original inner bean
  				// definition will not have inherited the merged outer bean's singleton status.
  				if (containingBd != null && !containingBd.isSingleton() && mbd.isSingleton()) {
  					mbd.setScope(containingBd.getScope());
  				}
  
  				// Cache the merged bean definition for the time being
  				// (it might still get re-merged later on in order to pick up metadata changes)
  				if (containingBd == null && isCacheBeanMetadata()) {
  					this.mergedBeanDefinitions.put(beanName, mbd);
  				}
  			}
  			if (previous != null) {
  				copyRelevantMergedBeanDefinitionCaches(previous, mbd);
  			}
  			return mbd;
  		}
  	}
  ```

  

  - 父子BeanDefinition 合并
    - 当前BeanFactory 查找
    - 层次性BeanFactory 查找

## Spring Bean Class 加载阶段

### `AbstractBeanFactory#resolveBeanClass`

````java
	protected Class<?> resolveBeanClass(final RootBeanDefinition mbd, String beanName, final Class<?>... typesToMatch)
			throws CannotLoadBeanClassException {

		try {
			if (mbd.hasBeanClass()) {
				return mbd.getBeanClass();
			}
			if (System.getSecurityManager() != null) {
				return AccessController.doPrivileged((PrivilegedExceptionAction<Class<?>>) () ->
					doResolveBeanClass(mbd, typesToMatch), getAccessControlContext());
			}
			else {
				return doResolveBeanClass(mbd, typesToMatch);
			}
		}
		catch (PrivilegedActionException pae) {
			ClassNotFoundException ex = (ClassNotFoundException) pae.getException();
			throw new CannotLoadBeanClassException(mbd.getResourceDescription(), beanName, mbd.getBeanClassName(), ex);
		}
		catch (ClassNotFoundException ex) {
			throw new CannotLoadBeanClassException(mbd.getResourceDescription(), beanName, mbd.getBeanClassName(), ex);
		}
		catch (LinkageError err) {
			throw new CannotLoadBeanClassException(mbd.getResourceDescription(), beanName, mbd.getBeanClassName(), err);
		}
	}

	@Nullable
	private Class<?> doResolveBeanClass(RootBeanDefinition mbd, Class<?>... typesToMatch)
			throws ClassNotFoundException {

		ClassLoader beanClassLoader = getBeanClassLoader();
		ClassLoader dynamicLoader = beanClassLoader;
		boolean freshResolve = false;

		if (!ObjectUtils.isEmpty(typesToMatch)) {
			// When just doing type checks (i.e. not creating an actual instance yet),
			// use the specified temporary class loader (e.g. in a weaving scenario).
			ClassLoader tempClassLoader = getTempClassLoader();
			if (tempClassLoader != null) {
				dynamicLoader = tempClassLoader;
				freshResolve = true;
				if (tempClassLoader instanceof DecoratingClassLoader) {
					DecoratingClassLoader dcl = (DecoratingClassLoader) tempClassLoader;
					for (Class<?> typeToMatch : typesToMatch) {
						dcl.excludeClass(typeToMatch.getName());
					}
				}
			}
		}

		String className = mbd.getBeanClassName();
		if (className != null) {
			Object evaluated = evaluateBeanDefinitionString(className, mbd);
			if (!className.equals(evaluated)) {
				// A dynamically resolved expression, supported as of 4.2...
				if (evaluated instanceof Class) {
					return (Class<?>) evaluated;
				}
				else if (evaluated instanceof String) {
					className = (String) evaluated;
					freshResolve = true;
				}
				else {
					throw new IllegalStateException("Invalid class name expression result: " + evaluated);
				}
			}
			if (freshResolve) {
				// When resolving against a temporary class loader, exit early in order
				// to avoid storing the resolved Class in the bean definition.
				if (dynamicLoader != null) {
					try {
						return dynamicLoader.loadClass(className);
					}
					catch (ClassNotFoundException ex) {
						if (logger.isTraceEnabled()) {
							logger.trace("Could not load class [" + className + "] from " + dynamicLoader + ": " + ex);
						}
					}
				}
				return ClassUtils.forName(className, dynamicLoader);
			}
		}

		// Resolve regularly, caching the result in the BeanDefinition...
		return mbd.resolveBeanClass(beanClassLoader);
	}

	// AbstractBeanDefinition#resolveBeanClass
	public Class<?> resolveBeanClass(@Nullable ClassLoader classLoader) throws ClassNotFoundException {
		String className = getBeanClassName();
		if (className == null) {
			return null;
		}
		Class<?> resolvedClass = ClassUtils.forName(className, classLoader);
		this.beanClass = resolvedClass;
		return resolvedClass;
	}

````



- `ClassLoader` 类加载
- `Java Security` 安全控制
- `ConfigurableBeanFactory` 临时`ClassLoader`

## Spring Bean 实例化前阶段

- 非主流生命周期-Bean 实例化前阶段
  - `InstantiationAwareBeanPostProcessor#postProcessBeforeInstantiation`

### `AbstractAutowireCapableBeanFactory#resolveBeforeInstantiation`

```java
	protected Object resolveBeforeInstantiation(String beanName, RootBeanDefinition mbd) {
		Object bean = null;
		if (!Boolean.FALSE.equals(mbd.beforeInstantiationResolved)) {
			// Make sure bean class is actually resolved at this point.
			if (!mbd.isSynthetic() && hasInstantiationAwareBeanPostProcessors()) {
				Class<?> targetType = determineTargetType(beanName, mbd);
				if (targetType != null) {
					bean = applyBeanPostProcessorsBeforeInstantiation(targetType, beanName);
					if (bean != null) {
						bean = applyBeanPostProcessorsAfterInitialization(bean, beanName);
					}
				}
			}
			mbd.beforeInstantiationResolved = (bean != null);
		}
		return bean;
	}

	protected Object applyBeanPostProcessorsBeforeInstantiation(Class<?> beanClass, String beanName) {
		for (BeanPostProcessor bp : getBeanPostProcessors()) {
			if (bp instanceof InstantiationAwareBeanPostProcessor) {
				InstantiationAwareBeanPostProcessor ibp = (InstantiationAwareBeanPostProcessor) bp;
				Object result = ibp.postProcessBeforeInstantiation(beanClass, beanName);
				if (result != null) {
					return result;
				}
			}
		}
		return null;
	}
```

## Spring Bean 实例化阶段

- 实例化方式

  - 传统实例化方式

    - 实例化策略-InstantiationStrategy

  - 构造器依赖注入

    构造器注入按照类型注入，实际最终调用`resolveDependency`方法

### `AbstractAutowireCapableBeanFactory#createBeanInstance`

```java
	protected BeanWrapper createBeanInstance(String beanName, RootBeanDefinition mbd, @Nullable Object[] args) {
		// Make sure bean class is actually resolved at this point.
		Class<?> beanClass = resolveBeanClass(mbd, beanName);

		if (beanClass != null && !Modifier.isPublic(beanClass.getModifiers()) && !mbd.isNonPublicAccessAllowed()) {
			throw new BeanCreationException(mbd.getResourceDescription(), beanName,
					"Bean class isn't public, and non-public access not allowed: " + beanClass.getName());
		}

		Supplier<?> instanceSupplier = mbd.getInstanceSupplier();
		if (instanceSupplier != null) {
			return obtainFromSupplier(instanceSupplier, beanName);
		}

		if (mbd.getFactoryMethodName() != null) {
			return instantiateUsingFactoryMethod(beanName, mbd, args);
		}

		// Shortcut when re-creating the same bean...
		boolean resolved = false;
		boolean autowireNecessary = false;
		if (args == null) {
			synchronized (mbd.constructorArgumentLock) {
				if (mbd.resolvedConstructorOrFactoryMethod != null) {
					resolved = true;
					autowireNecessary = mbd.constructorArgumentsResolved;
				}
			}
		}
		if (resolved) {
			if (autowireNecessary) {
				return autowireConstructor(beanName, mbd, null, null);
			}
			else {
				return instantiateBean(beanName, mbd);
			}
		}

		// SmartInstantiationAwareBeanPostProcessor#determineCandidateConstructors 
        // 可以通过实现该接口 来选择的构造方法
		Constructor<?>[] ctors = determineConstructorsFromBeanPostProcessors(beanClass, beanName);
		if (ctors != null || mbd.getResolvedAutowireMode() == AUTOWIRE_CONSTRUCTOR ||
				mbd.hasConstructorArgumentValues() || !ObjectUtils.isEmpty(args)) {
			return autowireConstructor(beanName, mbd, ctors, args);
		}

		// Preferred constructors for default construction?
		ctors = mbd.getPreferredConstructors();
		if (ctors != null) {
			return autowireConstructor(beanName, mbd, ctors, null);
		}

		// No special handling: simply use no-arg constructor.
		return instantiateBean(beanName, mbd);
	}
	// 通过传统方法构造
	protected BeanWrapper instantiateBean(final String beanName, final RootBeanDefinition mbd) {
		try {
			Object beanInstance;
			final BeanFactory parent = this;
			if (System.getSecurityManager() != null) {
				beanInstance = AccessController.doPrivileged((PrivilegedAction<Object>) () ->
						getInstantiationStrategy().instantiate(mbd, beanName, parent),
						getAccessControlContext());
			}
			else {
				beanInstance = getInstantiationStrategy().instantiate(mbd, beanName, parent);
			}
			BeanWrapper bw = new BeanWrapperImpl(beanInstance);
			initBeanWrapper(bw);
			return bw;
		}
		catch (Throwable ex) {
			throw new BeanCreationException(
					mbd.getResourceDescription(), beanName, "Instantiation of bean failed", ex);
		}
	}
	//SimpleInstantiationStrategy#instantiate
	public Object instantiate(RootBeanDefinition bd, @Nullable String beanName, BeanFactory owner) {
		// Don't override the class with CGLIB if no overrides.
		if (!bd.hasMethodOverrides()) {
			Constructor<?> constructorToUse;
			synchronized (bd.constructorArgumentLock) {
				constructorToUse = (Constructor<?>) bd.resolvedConstructorOrFactoryMethod;
				if (constructorToUse == null) {
					final Class<?> clazz = bd.getBeanClass();
					if (clazz.isInterface()) {
						throw new BeanInstantiationException(clazz, "Specified class is an interface");
					}
					try {
						if (System.getSecurityManager() != null) {
							constructorToUse = AccessController.doPrivileged(
									(PrivilegedExceptionAction<Constructor<?>>) clazz::getDeclaredConstructor);
						}
						else {
							constructorToUse = clazz.getDeclaredConstructor();
						}
						bd.resolvedConstructorOrFactoryMethod = constructorToUse;
					}
					catch (Throwable ex) {
						throw new BeanInstantiationException(clazz, "No default constructor found", ex);
					}
				}
			}
			return BeanUtils.instantiateClass(constructorToUse);
		}
		else {
			// Must generate CGLIB subclass.
			return instantiateWithMethodInjection(bd, beanName, owner);
		}
	}

	// 通过构造器实例化
	// ConstructorResolver#autowireConstructor
	public BeanWrapper autowireConstructor(String beanName, RootBeanDefinition mbd,
			@Nullable Constructor<?>[] chosenCtors, @Nullable Object[] explicitArgs) {

		BeanWrapperImpl bw = new BeanWrapperImpl();
		this.beanFactory.initBeanWrapper(bw);

		Constructor<?> constructorToUse = null;
		ArgumentsHolder argsHolderToUse = null;
		Object[] argsToUse = null;

		if (explicitArgs != null) {
			argsToUse = explicitArgs;
		}
		else {
			Object[] argsToResolve = null;
			synchronized (mbd.constructorArgumentLock) {
				constructorToUse = (Constructor<?>) mbd.resolvedConstructorOrFactoryMethod;
				if (constructorToUse != null && mbd.constructorArgumentsResolved) {
					// Found a cached constructor...
					argsToUse = mbd.resolvedConstructorArguments;
					if (argsToUse == null) {
						argsToResolve = mbd.preparedConstructorArguments;
					}
				}
			}
			if (argsToResolve != null) {
				argsToUse = resolvePreparedArguments(beanName, mbd, bw, constructorToUse, argsToResolve, true);
			}
		}

		if (constructorToUse == null || argsToUse == null) {
			// Take specified constructors, if any.
			Constructor<?>[] candidates = chosenCtors;
			if (candidates == null) {
				Class<?> beanClass = mbd.getBeanClass();
				try {
					candidates = (mbd.isNonPublicAccessAllowed() ?
							beanClass.getDeclaredConstructors() : beanClass.getConstructors());
				}
				catch (Throwable ex) {
					throw new BeanCreationException(mbd.getResourceDescription(), beanName,
							"Resolution of declared constructors on bean Class [" + beanClass.getName() +
							"] from ClassLoader [" + beanClass.getClassLoader() + "] failed", ex);
				}
			}

			if (candidates.length == 1 && explicitArgs == null && !mbd.hasConstructorArgumentValues()) {
				Constructor<?> uniqueCandidate = candidates[0];
				if (uniqueCandidate.getParameterCount() == 0) {
					synchronized (mbd.constructorArgumentLock) {
						mbd.resolvedConstructorOrFactoryMethod = uniqueCandidate;
						mbd.constructorArgumentsResolved = true;
						mbd.resolvedConstructorArguments = EMPTY_ARGS;
					}
					bw.setBeanInstance(instantiate(beanName, mbd, uniqueCandidate, EMPTY_ARGS));
					return bw;
				}
			}

			// Need to resolve the constructor.
			boolean autowiring = (chosenCtors != null ||
					mbd.getResolvedAutowireMode() == AutowireCapableBeanFactory.AUTOWIRE_CONSTRUCTOR);
			ConstructorArgumentValues resolvedValues = null;

			int minNrOfArgs;
			if (explicitArgs != null) {
				minNrOfArgs = explicitArgs.length;
			}
			else {
				ConstructorArgumentValues cargs = mbd.getConstructorArgumentValues();
				resolvedValues = new ConstructorArgumentValues();
				minNrOfArgs = resolveConstructorArguments(beanName, mbd, bw, cargs, resolvedValues);
			}

			AutowireUtils.sortConstructors(candidates);
			int minTypeDiffWeight = Integer.MAX_VALUE;
			Set<Constructor<?>> ambiguousConstructors = null;
			LinkedList<UnsatisfiedDependencyException> causes = null;

			for (Constructor<?> candidate : candidates) {

				int parameterCount = candidate.getParameterCount();

				if (constructorToUse != null && argsToUse != null && argsToUse.length > parameterCount) {
					// Already found greedy constructor that can be satisfied ->
					// do not look any further, there are only less greedy constructors left.
					break;
				}
				if (parameterCount < minNrOfArgs) {
					continue;
				}

				ArgumentsHolder argsHolder;
				Class<?>[] paramTypes = candidate.getParameterTypes();
				if (resolvedValues != null) {
					try {
						String[] paramNames = ConstructorPropertiesChecker.evaluate(candidate, parameterCount);
						if (paramNames == null) {
							ParameterNameDiscoverer pnd = this.beanFactory.getParameterNameDiscoverer();
							if (pnd != null) {
								paramNames = pnd.getParameterNames(candidate);
							}
						}
						argsHolder = createArgumentArray(beanName, mbd, resolvedValues, bw, paramTypes, paramNames,
								getUserDeclaredConstructor(candidate), autowiring, candidates.length == 1);
					}
					catch (UnsatisfiedDependencyException ex) {
						if (logger.isTraceEnabled()) {
							logger.trace("Ignoring constructor [" + candidate + "] of bean '" + beanName + "': " + ex);
						}
						// Swallow and try next constructor.
						if (causes == null) {
							causes = new LinkedList<>();
						}
						causes.add(ex);
						continue;
					}
				}
				else {
					// Explicit arguments given -> arguments length must match exactly.
					if (parameterCount != explicitArgs.length) {
						continue;
					}
					argsHolder = new ArgumentsHolder(explicitArgs);
				}

				int typeDiffWeight = (mbd.isLenientConstructorResolution() ?
						argsHolder.getTypeDifferenceWeight(paramTypes) : argsHolder.getAssignabilityWeight(paramTypes));
				// Choose this constructor if it represents the closest match.
				if (typeDiffWeight < minTypeDiffWeight) {
					constructorToUse = candidate;
					argsHolderToUse = argsHolder;
					argsToUse = argsHolder.arguments;
					minTypeDiffWeight = typeDiffWeight;
					ambiguousConstructors = null;
				}
				else if (constructorToUse != null && typeDiffWeight == minTypeDiffWeight) {
					if (ambiguousConstructors == null) {
						ambiguousConstructors = new LinkedHashSet<>();
						ambiguousConstructors.add(constructorToUse);
					}
					ambiguousConstructors.add(candidate);
				}
			}

			if (constructorToUse == null) {
				if (causes != null) {
					UnsatisfiedDependencyException ex = causes.removeLast();
					for (Exception cause : causes) {
						this.beanFactory.onSuppressedException(cause);
					}
					throw ex;
				}
				throw new BeanCreationException(mbd.getResourceDescription(), beanName,
						"Could not resolve matching constructor " +
						"(hint: specify index/type/name arguments for simple parameters to avoid type ambiguities)");
			}
			else if (ambiguousConstructors != null && !mbd.isLenientConstructorResolution()) {
				throw new BeanCreationException(mbd.getResourceDescription(), beanName,
						"Ambiguous constructor matches found in bean '" + beanName + "' " +
						"(hint: specify index/type/name arguments for simple parameters to avoid type ambiguities): " +
						ambiguousConstructors);
			}

			if (explicitArgs == null && argsHolderToUse != null) {
				argsHolderToUse.storeCache(mbd, constructorToUse);
			}
		}

		Assert.state(argsToUse != null, "Unresolved constructor arguments");
		bw.setBeanInstance(instantiate(beanName, mbd, constructorToUse, argsToUse));
		return bw;
	}
	private ArgumentsHolder createArgumentArray(
			String beanName, RootBeanDefinition mbd, @Nullable ConstructorArgumentValues resolvedValues,
			BeanWrapper bw, Class<?>[] paramTypes, @Nullable String[] paramNames, Executable executable,
			boolean autowiring, boolean fallback) throws UnsatisfiedDependencyException {

		TypeConverter customConverter = this.beanFactory.getCustomTypeConverter();
		TypeConverter converter = (customConverter != null ? customConverter : bw);

		ArgumentsHolder args = new ArgumentsHolder(paramTypes.length);
		Set<ConstructorArgumentValues.ValueHolder> usedValueHolders = new HashSet<>(paramTypes.length);
		Set<String> autowiredBeanNames = new LinkedHashSet<>(4);

		for (int paramIndex = 0; paramIndex < paramTypes.length; paramIndex++) {
			Class<?> paramType = paramTypes[paramIndex];
			String paramName = (paramNames != null ? paramNames[paramIndex] : "");
			// Try to find matching constructor argument value, either indexed or generic.
			ConstructorArgumentValues.ValueHolder valueHolder = null;
			if (resolvedValues != null) {
				valueHolder = resolvedValues.getArgumentValue(paramIndex, paramType, paramName, usedValueHolders);
				// If we couldn't find a direct match and are not supposed to autowire,
				// let's try the next generic, untyped argument value as fallback:
				// it could match after type conversion (for example, String -> int).
				if (valueHolder == null && (!autowiring || paramTypes.length == resolvedValues.getArgumentCount())) {
					valueHolder = resolvedValues.getGenericArgumentValue(null, null, usedValueHolders);
				}
			}
			if (valueHolder != null) {
				// We found a potential match - let's give it a try.
				// Do not consider the same value definition multiple times!
				usedValueHolders.add(valueHolder);
				Object originalValue = valueHolder.getValue();
				Object convertedValue;
				if (valueHolder.isConverted()) {
					convertedValue = valueHolder.getConvertedValue();
					args.preparedArguments[paramIndex] = convertedValue;
				}
				else {
					MethodParameter methodParam = MethodParameter.forExecutable(executable, paramIndex);
					try {
						convertedValue = converter.convertIfNecessary(originalValue, paramType, methodParam);
					}
					catch (TypeMismatchException ex) {
						throw new UnsatisfiedDependencyException(
								mbd.getResourceDescription(), beanName, new InjectionPoint(methodParam),
								"Could not convert argument value of type [" +
										ObjectUtils.nullSafeClassName(valueHolder.getValue()) +
										"] to required type [" + paramType.getName() + "]: " + ex.getMessage());
					}
					Object sourceHolder = valueHolder.getSource();
					if (sourceHolder instanceof ConstructorArgumentValues.ValueHolder) {
						Object sourceValue = ((ConstructorArgumentValues.ValueHolder) sourceHolder).getValue();
						args.resolveNecessary = true;
						args.preparedArguments[paramIndex] = sourceValue;
					}
				}
				args.arguments[paramIndex] = convertedValue;
				args.rawArguments[paramIndex] = originalValue;
			}
			else {
				MethodParameter methodParam = MethodParameter.forExecutable(executable, paramIndex);
				// No explicit match found: we're either supposed to autowire or
				// have to fail creating an argument array for the given constructor.
				if (!autowiring) {
					throw new UnsatisfiedDependencyException(
							mbd.getResourceDescription(), beanName, new InjectionPoint(methodParam),
							"Ambiguous argument values for parameter of type [" + paramType.getName() +
							"] - did you specify the correct bean references as arguments?");
				}
				try {
					Object autowiredArgument = resolveAutowiredArgument(
							methodParam, beanName, autowiredBeanNames, converter, fallback);
					args.rawArguments[paramIndex] = autowiredArgument;
					args.arguments[paramIndex] = autowiredArgument;
					args.preparedArguments[paramIndex] = autowiredArgumentMarker;
					args.resolveNecessary = true;
				}
				catch (BeansException ex) {
					throw new UnsatisfiedDependencyException(
							mbd.getResourceDescription(), beanName, new InjectionPoint(methodParam), ex);
				}
			}
		}

		for (String autowiredBeanName : autowiredBeanNames) {
			this.beanFactory.registerDependentBean(autowiredBeanName, beanName);
			if (logger.isDebugEnabled()) {
				logger.debug("Autowiring by type from bean name '" + beanName +
						"' via " + (executable instanceof Constructor ? "constructor" : "factory method") +
						" to bean named '" + autowiredBeanName + "'");
			}
		}

		return args;
	}
	protected Object resolveAutowiredArgument(MethodParameter param, String beanName,
			@Nullable Set<String> autowiredBeanNames, TypeConverter typeConverter, boolean fallback) {

		Class<?> paramType = param.getParameterType();
		if (InjectionPoint.class.isAssignableFrom(paramType)) {
			InjectionPoint injectionPoint = currentInjectionPoint.get();
			if (injectionPoint == null) {
				throw new IllegalStateException("No current InjectionPoint available for " + param);
			}
			return injectionPoint;
		}
		try {
			return this.beanFactory.resolveDependency(
					new DependencyDescriptor(param, true), beanName, autowiredBeanNames, typeConverter);
		}
		catch (NoUniqueBeanDefinitionException ex) {
			throw ex;
		}
		catch (NoSuchBeanDefinitionException ex) {
			if (fallback) {
				// Single constructor or factory method -> let's return an empty array/collection
				// for e.g. a vararg or a non-null List/Set/Map parameter.
				if (paramType.isArray()) {
					return Array.newInstance(paramType.getComponentType(), 0);
				}
				else if (CollectionFactory.isApproximableCollectionType(paramType)) {
					return CollectionFactory.createCollection(paramType, 0);
				}
				else if (CollectionFactory.isApproximableMapType(paramType)) {
					return CollectionFactory.createMap(paramType, 0);
				}
			}
			throw ex;
		}
	}
```

## Spring Bean 实例化后阶段

- Bean 属性赋值（Populate）判断（判断是否使用Spring进行字段赋值）
  - `InstantiationAwareBeanPostProcessor#postProcessAfterInstantiation`

### `AbstractAutowireCapableBeanFactory#populateBean`

```java
protected void populateBean(String beanName, RootBeanDefinition mbd, @Nullable BeanWrapper bw) {
		if (bw == null) {
			if (mbd.hasPropertyValues()) {
				throw new BeanCreationException(
						mbd.getResourceDescription(), beanName, "Cannot apply property values to null instance");
			}
			else {
				// Skip property population phase for null instance.
				return;
			}
		}

		// Give any InstantiationAwareBeanPostProcessors the opportunity to modify the
		// state of the bean before properties are set. This can be used, for example,
		// to support styles of field injection.
		if (!mbd.isSynthetic() && hasInstantiationAwareBeanPostProcessors()) {
			for (BeanPostProcessor bp : getBeanPostProcessors()) {
				if (bp instanceof InstantiationAwareBeanPostProcessor) {
					InstantiationAwareBeanPostProcessor ibp = (InstantiationAwareBeanPostProcessor) bp;
					if (!ibp.postProcessAfterInstantiation(bw.getWrappedInstance(), beanName)) {
						return;
					}
				}
			}
		}

	...
	}
```

## Spring Bean 属性赋值前阶段

- Bean 属性值元信息
  - PropertyValues
- Bean 属性赋值前回调
  - Spring 1.2 -5.0：`InstantiationAwareBeanPostProcessor#postProcessPropertyValues`
  - Spring 5.1：`InstantiationAwareBeanPostProcessor#postProcessProperties`

### `AbstractAutowireCapableBeanFactory#populateBean`

```java
	protected void populateBean(String beanName, RootBeanDefinition mbd, @Nullable BeanWrapper bw) {
		...
		boolean hasInstAwareBpps = hasInstantiationAwareBeanPostProcessors();
		boolean needsDepCheck = (mbd.getDependencyCheck() != AbstractBeanDefinition.DEPENDENCY_CHECK_NONE);

		PropertyDescriptor[] filteredPds = null;
		if (hasInstAwareBpps) {
			if (pvs == null) {
				pvs = mbd.getPropertyValues();
			}
			for (BeanPostProcessor bp : getBeanPostProcessors()) {
				if (bp instanceof InstantiationAwareBeanPostProcessor) {
					InstantiationAwareBeanPostProcessor ibp = (InstantiationAwareBeanPostProcessor) bp;
					PropertyValues pvsToUse = ibp.postProcessProperties(pvs, bw.getWrappedInstance(), beanName);
					if (pvsToUse == null) {
						if (filteredPds == null) {
							filteredPds = filterPropertyDescriptorsForDependencyCheck(bw, mbd.allowCaching);
						}
						pvsToUse = ibp.postProcessPropertyValues(pvs, filteredPds, bw.getWrappedInstance(), beanName);
						if (pvsToUse == null) {
							return;
						}
					}
					pvs = pvsToUse;
				}
			}
		}
		if (needsDepCheck) {
			if (filteredPds == null) {
				filteredPds = filterPropertyDescriptorsForDependencyCheck(bw, mbd.allowCaching);
			}
			checkDependencies(beanName, mbd, filteredPds, pvs);
		}

		if (pvs != null) {
			applyPropertyValues(beanName, mbd, bw, pvs);
		}
	}
```

## Spring Bean Aware接口回调阶段

- Spring Aware 接口
  - `BeanNameAware`
  - `BeanClassLoaderAware`
  - `BeanFactoryAware`
  - `EnvironmentAware`
  - `EmbeddedValueResolverAware`
  - `ResourceLoaderAware`
  - `ApplicationEventPublisherAware`
  - `MessageSourceAware`
  - `ApplicationContextAware`

### `AbstractAutowireCapableBeanFactory#initializeBean`

```java
	protected Object initializeBean(final String beanName, final Object bean, @Nullable RootBeanDefinition mbd) {
		if (System.getSecurityManager() != null) {
			AccessController.doPrivileged((PrivilegedAction<Object>) () -> {
				invokeAwareMethods(beanName, bean);
				return null;
			}, getAccessControlContext());
		}
		else {
			invokeAwareMethods(beanName, bean);
		}

	...
	}

	private void invokeAwareMethods(final String beanName, final Object bean) {
		if (bean instanceof Aware) {
			if (bean instanceof BeanNameAware) {
				((BeanNameAware) bean).setBeanName(beanName);
			}
			if (bean instanceof BeanClassLoaderAware) {
				ClassLoader bcl = getBeanClassLoader();
				if (bcl != null) {
					((BeanClassLoaderAware) bean).setBeanClassLoader(bcl);
				}
			}
			if (bean instanceof BeanFactoryAware) {
				((BeanFactoryAware) bean).setBeanFactory(AbstractAutowireCapableBeanFactory.this);
			}
		}
	}
```
### `ApplicationContextAwareProcessor#postProcessBeforeInitialization`
```java
	public Object postProcessBeforeInitialization(Object bean, String beanName) throws BeansException {
		if (!(bean instanceof EnvironmentAware || bean instanceof EmbeddedValueResolverAware ||
				bean instanceof ResourceLoaderAware || bean instanceof ApplicationEventPublisherAware ||
				bean instanceof MessageSourceAware || bean instanceof ApplicationContextAware)){
			return bean;
		}

		AccessControlContext acc = null;

		if (System.getSecurityManager() != null) {
			acc = this.applicationContext.getBeanFactory().getAccessControlContext();
		}

		if (acc != null) {
			AccessController.doPrivileged((PrivilegedAction<Object>) () -> {
				invokeAwareInterfaces(bean);
				return null;
			}, acc);
		}
		else {
			invokeAwareInterfaces(bean);
		}

		return bean;
	}

	private void invokeAwareInterfaces(Object bean) {
		if (bean instanceof EnvironmentAware) {
			((EnvironmentAware) bean).setEnvironment(this.applicationContext.getEnvironment());
		}
		if (bean instanceof EmbeddedValueResolverAware) {
			((EmbeddedValueResolverAware) bean).setEmbeddedValueResolver(this.embeddedValueResolver);
		}
		if (bean instanceof ResourceLoaderAware) {
			((ResourceLoaderAware) bean).setResourceLoader(this.applicationContext);
		}
		if (bean instanceof ApplicationEventPublisherAware) {
			((ApplicationEventPublisherAware) bean).setApplicationEventPublisher(this.applicationContext);
		}
		if (bean instanceof MessageSourceAware) {
			((MessageSourceAware) bean).setMessageSource(this.applicationContext);
		}
		if (bean instanceof ApplicationContextAware) {
			((ApplicationContextAware) bean).setApplicationContext(this.applicationContext);
		}
	}
```

## Spring Bean 初始化前阶段 总结

- 已完成

  - Bean 实例化
  - Bean 属性赋值
  - Bean Aware 接口回调

- 方法回调

  - `BeanPostProcessor#postProcessBeforeInitialization`

  ### `AbstractAutowireCapableBeanFactory#initializeBean`

  ```java
  	protected Object initializeBean(final String beanName, final Object bean, @Nullable RootBeanDefinition mbd) {
  	...
  	Object wrappedBean = bean;
      if (mbd == null || !mbd.isSynthetic()) {
          wrappedBean = applyBeanPostProcessorsBeforeInitialization(wrappedBean, beanName);
      }
  	...
  	}
  
  	private void invokeAwareMethods(final String beanName, final Object bean) {
  		if (bean instanceof Aware) {
  			if (bean instanceof BeanNameAware) {
  				((BeanNameAware) bean).setBeanName(beanName);
  			}
  			if (bean instanceof BeanClassLoaderAware) {
  				ClassLoader bcl = getBeanClassLoader();
  				if (bcl != null) {
  					((BeanClassLoaderAware) bean).setBeanClassLoader(bcl);
  				}
  			}
  			if (bean instanceof BeanFactoryAware) {
  				((BeanFactoryAware) bean).setBeanFactory(AbstractAutowireCapableBeanFactory.this);
  			}
  		}
  	}
  ```

## Spring Bean 初始化阶段

- Bean 初始化（Initialization）

  - `@PostConstruct` 标注方法

  `AbstractAutowireCapableBeanFactory#applyBeanPostProcessorsBeforeInitialization`

  - 实现`InitializingBean` 接口的`afterPropertiesSet()` 方法

  `AbstractAutowireCapableBeanFactory#invokeInitMethods`

  - 自定义初始化方法

  `AbstractAutowireCapableBeanFactory#invokeCustomInitMethod`

## Spring Bean 初始化后阶段

- 方法回调

  - BeanPostProcessor#postProcessAfterInitialization

  `AbstractAutowireCapableBeanFactory#applyBeanPostProcessorsAfterInitialization`

## Spring Bean 初始化完成阶段

- 方法回调

  - Spring 4.1 +：`SmartInitializingSingleton#afterSingletonsInstantiated`

  在`AbstractApplicationContext#finishBeanFactoryInitialization`调用`DefaultListableBeanFactory#preInstantiateSingletons`

## Spring Bean 销毁前阶段

- 方法回调

  - `DestructionAwareBeanPostProcessor#postProcessBeforeDestruction`

  ```java
  	public void destroy() {
  		if (!CollectionUtils.isEmpty(this.beanPostProcessors)) {
  			for (DestructionAwareBeanPostProcessor processor : this.beanPostProcessors) {
  				processor.postProcessBeforeDestruction(this.bean, this.beanName);
  			}
  		}
  
  		...
  	}
  ```

## Spring Bean 销毁阶段

- Bean 销毁（Destroy）
  - @PreDestroy 标注方法
  - 实现DisposableBean 接口的destroy() 方法
  - 自定义销毁方法

```java
	public void destroy() {
		...
		if (this.invokeDisposableBean) {
			if (logger.isTraceEnabled()) {
				logger.trace("Invoking destroy() on bean with name '" + this.beanName + "'");
			}
			try {
				if (System.getSecurityManager() != null) {
					AccessController.doPrivileged((PrivilegedExceptionAction<Object>) () -> {
						((DisposableBean) this.bean).destroy();
						return null;
					}, this.acc);
				}
				else {
					((DisposableBean) this.bean).destroy();
				}
			}
			catch (Throwable ex) {
				String msg = "Invocation of destroy method failed on bean with name '" + this.beanName + "'";
				if (logger.isDebugEnabled()) {
					logger.warn(msg, ex);
				}
				else {
					logger.warn(msg + ": " + ex);
				}
			}
		}

		if (this.destroyMethod != null) {
			invokeCustomDestroyMethod(this.destroyMethod);
		}
		else if (this.destroyMethodName != null) {
			Method methodToInvoke = determineDestroyMethod(this.destroyMethodName);
			if (methodToInvoke != null) {
				invokeCustomDestroyMethod(ClassUtils.getInterfaceMethodIfPossible(methodToInvoke));
			}
		}
	}
```

## BeanFactory 是怎样处理Bean 生命周期 总结

- BeanFactory 的默认实现为DefaultListableBeanFactory，其中Bean生命周期与方法映射如下：
  - BeanDefinition 注册阶段-`registerBeanDefinition`
  - BeanDefinition 合并阶段-`getMergedBeanDefinition`
  - Bean 实例化前阶段-`resolveBeforeInstantiation`
  - Bean 实例化阶段-`createBeanInstance`
  - Bean 初始化后阶段-`populateBean`
  - Bean 属性赋值前阶段-`populateBean`
  - Bean 属性赋值阶段-`populateBean`
  - Bean Aware 接口回调阶段-`initializeBean`
  - Bean 初始化前阶段-`initializeBean`
  - Bean 初始化阶段-`initializeBean`
  - Bean 初始化后阶段-`initializeBean`
  - Bean 初始化完成阶段-`preInstantiateSingletons`
  - Bean 销毁前阶段-`destroyBean`
  - Bean 销毁阶段-`destroyBean`



# Spring配置元信息

- 配置元信息
  - Spring Bean 配置元信息-BeanDefinition
  - Spring Bean 属性元信息-PropertyValues
  - Spring 容器配置元信息
  - Spring 外部化配置元信息-PropertySource
  - Spring Profile 元信息-@Profile



## Spring Bean 配置元信息

- Bean 配置元信息-BeanDefinition

  - GenericBeanDefinition：通用型BeanDefinition 
  - RootBeanDefinition：无Parent 的BeanDefinition 或者合并后BeanDefinition 
  - AnnotatedBeanDefinition：注解标注的BeanDefinition

## Spring Bean 属性元信息

- Bean 属性元信息-PropertyValues
  - 可修改实现-MutablePropertyValues
  - 元素成员-PropertyValue
- Bean 属性上下文存储-AttributeAccessor 
- Bean 元信息元素-BeanMetadataElement

## Spring 容器配置元信息

### Spring XML 配置元信息-beans 元素相关

| beans 元素属性              | 默认值       | 使用场景                                                     |
| --------------------------- | ------------ | ------------------------------------------------------------ |
| profile                     | null（留空） | Spring Profiles 配置值                                       |
| default-lazy-init           | default      | 当outter beans“default-lazy-init”属性存在时，继承该值，否则为“false” |
| default-merge               | default      | 当outterbeans“default-merge”属性存在时，继承该值，否则为“false” |
| default-autowire            | default      | 当outterbeans“default-autowire”属性存在时，继承该值，否则为“no” |
| default-autowire-candidates | null（留空） | 默认Spring Beans名称pattern                                  |
| default-init-method         | null（留空） | 默认Spring Beans自定义初始化方法                             |
| default-destroy-method      | null（留空） | 默认Spring Beans自定义销毁方法                               |

### SpringXML配置元信息-应用上下文相关

| XML 元素                          | 使用场景                             |
| --------------------------------- | ------------------------------------ |
| `<context:annotation-config/>`    | 激活Spring注解驱动                   |
| `<context:component-scan/>`       | Spring @Component以及自定义注解扫描  |
| `<context:load-time-weaver/>`     | 激活SpringLoadTimeWeaver             |
| `<context:mbean-export/>`         | 暴露SpringBeans作为JMXBeans          |
| `<context:mbean-server/>`         | 将当前平台作为 MBeanServer           |
| `<context:property-placeholder/>` | 加载外部化配置资源作为Spring属性配置 |
| `<context:property-override/>`    | 利用外部化配置资源覆盖Spring属性值   |

## 基于XML资源装载SpringBean配置元信息

- SpringBean配置元信息 底层实现 XmlBeanDefinitionReader

| XML 元素          | 使用场景                                   |
| ----------------- | ------------------------------------------ |
| `<beans:beans/>`  | 单XML资源下的多个SpringBeans配置           |
| `<beans:bean/>`   | 单个SpringBean定义（BeanDefinition）配置   |
| `<beans:alias/>`  | 为SpringBean定义（BeanDefinition）映射别名 |
| `<beans:import/>` | 加载外部SpringXML配置资源                  |

## 基于Properties资源装载SpringBean配置元信息

- SpringBean配置元信息 底层有PropertiesBeanDefinitionReader

| Properties 属性名 | 使用场景                     |
| ----------------- | ---------------------------- |
| (class)           | Bean 类全称限定名            |
| (abstract)        | 是否为抽象的BeanDefinition   |
| (parent)          | 指定parentBeanDefinition名称 |
| (lazy-init)       | 是否为延迟初始化             |
| (ref)             | 引用其他 Bean 的名称         |
| (scope)           | 设置 Bean 的 scope 属性      |
| ${n}              | n 表示第 n+1 个构造器参数    |

## 基于Java注解装载SpringBean配置元信息

### Spring模式注解

| Spring 注解    | 场景说明          | 起始版本 |
| -------------- | ----------------- | -------- |
| @Repository    | 数据仓储模式注解  | 2.0      |
| @Component     | 通用组件模式注解  | 2.5      |
| @Service       | 服务模式注解      | 2.5      |
| @Controller    | Web控制器模式注解 | 2.5      |
| @Configuration | 配置类模式注解    | 3.0      |

### Spring Bean定义注解

| Spring 注解 | 场景说明                                     | 起始版本 |
| ----------- | -------------------------------------------- | -------- |
| @Bean       | 替换 XML 元素 `<bean>`                       | 3.0      |
| @DependsOn  | 替代XML属性`<bean depends-on="..."/>`        | 3.0      |
| @Lazy       | 替代XML属性`<bean lazy-init="true|falses"/>` | 3.0      |
| @Primary    | 替换XML元素`<bean primary="true|false"/>`    | 3.0      |
| @Role       | 替换XML元素`<bean role="..."/>`              | 3.1      |
| @Lookup     | 替代XML属性`<bean lookup-method="...">`      | 4.1      |

## Spring Bean依赖注入注解

| Spring 注解 | 场景说明                            | 起始版本 |
| ----------- | ----------------------------------- | -------- |
| @Autowired  | Bean 依赖注入，支持多种依赖查找方式 | 2.5      |
| @Qualifier  | 细粒度的@Autowired依赖查找          | 2.5      |

| Java 注解 | 场景说明         | 起始版本 |
| --------- | ---------------- | -------- |
| @Resource | 类似于@Autowired | 2.5      |
| @Inject   | 类似于@Autowired | 2.5      |

## Spring Bean条件装配注解

| Spring 注解  | 场景说明       | 起始版本 |
| ------------ | -------------- | -------- |
| @Profile     | 配置化条件装配 | 3.1      |
| @Conditional | 编程条件装配   | 4.0      |

## Spring Bean生命周期回调注解

| Spring 注解    | 场景说明                                                     | 起始版本 |
| -------------- | ------------------------------------------------------------ | -------- |
| @PostConstruct | 替换XML元素`<bean init-method="..."/>`或 `InitializingBean`  | 2.5      |
| @PreDestroy    | 替换XML元素`<bean destroy-method="..."/>`或 `DisposableBean` | 2.5      |

## SpringBean配置元信息底层实现

### Spring XML 资源 BeanDefinition解析与注册

- 核心 API `XmlBeanDefinetionReader`
  - 资源  `Resource` 
  - 底层 `BeanDefinitionDocumentReader`
    - XML 解析 Java DOM Level 3 API 
    - BeanDefinition 解析 `BeanDefinitionParserDelegate`
    - BeanDefinition 注册 `BeanDefinitionRegistry`

### Spring Properties 资源BeanDefinition解析与注册

- 核心 API `PropertiesBeanDefinitionReader`
  - 资源  
    - 字节流 `Resource` 
    - 字符流`EncodeResource`

  - 底层
    - 存储 `java.util.Properties`
    - BeanDefinition 解析 API 内部实现
    - BeanDefinition 注册 `BeanDefinitionRegistry`

### Spring Java  config 注册 BeanDefinition解析与注册

- 核心 API `AnnotatedBeanDefinitionReader`

  - 资源  
    - 类对象 `Class`

  - 底层
    - 调节评估`ConditionEvaluator`
    - Bean 范围解析 `ScopeMetadataResolver`
    - BeanDefinition 解析 API 内部实现
    - BeanDefinition 处理 `AnnotationConfigUtils#processCommonDefinitionAnnotations`
    - BeanDefinition 注册 `BeanDefinitionRegistry`

```java
private <T> void doRegisterBean(Class<T> beanClass, @Nullable String name,
			@Nullable Class<? extends Annotation>[] qualifiers, @Nullable Supplier<T> supplier,
			@Nullable BeanDefinitionCustomizer[] customizers) {

		AnnotatedGenericBeanDefinition abd = new AnnotatedGenericBeanDefinition(beanClass);
		if (this.conditionEvaluator.shouldSkip(abd.getMetadata())) {
			return;
		}

		abd.setInstanceSupplier(supplier);
		ScopeMetadata scopeMetadata = this.scopeMetadataResolver.resolveScopeMetadata(abd);
		abd.setScope(scopeMetadata.getScopeName());
		String beanName = (name != null ? name : this.beanNameGenerator.generateBeanName(abd, this.registry));

		AnnotationConfigUtils.processCommonDefinitionAnnotations(abd);
		if (qualifiers != null) {
			for (Class<? extends Annotation> qualifier : qualifiers) {
				if (Primary.class == qualifier) {
					abd.setPrimary(true);
				}
				else if (Lazy.class == qualifier) {
					abd.setLazyInit(true);
				}
				else {
					abd.addQualifier(new AutowireCandidateQualifier(qualifier));
				}
			}
		}
		if (customizers != null) {
			for (BeanDefinitionCustomizer customizer : customizers) {
				customizer.customize(abd);
			}
		}

		BeanDefinitionHolder definitionHolder = new BeanDefinitionHolder(abd, beanName);
		definitionHolder = AnnotationConfigUtils.applyScopedProxyMode(scopeMetadata, definitionHolder, this.registry);
		BeanDefinitionReaderUtils.registerBeanDefinition(definitionHolder, this.registry);
	}
```

## 基于XML资源装载Spring IoC容器配置元信息

### Spring IoC容器相关XML配置

| 命名空间 | 所属模块       | Schema 资源 URL                                              |
| -------- | -------------- | ------------------------------------------------------------ |
| beans    | spring-beans   | https://www.springframework.org/schema/beans/spring-beans.xsd |
| context  | spring-context | https://www.springframework.org/schema/context/spring-context.xsd |
| aop      | spring-aop     | https://www.springframework.org/schema/aop/spring-aop.xsd    |
| tx       | spring-tx      | https://www.springframework.org/schema/tx/spring-tx.xsd      |
| util     | spring-beans   | https://www.springframework.org/schema/util/spring-util.xsd  |
| tool     | spring-beans   | https://www.springframework.org/schema/tool/spring-tool.xsd  |

### Spring IoC容器装配注解

| Spring 注解     | 场景说明                                | 其实版本 |
| --------------- | --------------------------------------- | -------- |
| @ImportResource | 替换XML元素`<import>`                   | 3.0      |
| @Import         | 导入Configuration Class                 | 3.0      |
| @ComponentScan  | 扫描指定package下标注Spring模式注解的类 | 3.1      |

### Spring IoC配属属性注解

| Spring 注解      | 场景说明                         | 其实版本 |
| ---------------- | -------------------------------- | -------- |
| @PropertySource  | 配置属性抽象 PropertySource 注解 | 3.1      |
| @PropertySources | @PropertySource集合注解          | 4.0      |

## 基于Properties资源装载外部化配

- 注解驱动
  - `@org.springframework.context.annotation.PropertySource`
  - `@org.springframework.context.annotation.PropertySources`
- API 编程
  - `org.springframework.core.env.PropertySource`
  - `org.springframework.core.env.PropertySources`

## 基于 YAML资源装载外部化配置

- API编程
  - `org.springframework.beans.factory.config.YamlProcessor`
    - `org.springframework.beans.factory.config.YamlMapFactoryBean`
    - `org.springframework.beans.factory.config.YamlPropertiesFactoryBean`

# Spring 资源管理（Resources）

## Java 标准资源管理

### Java 标准资源定位

| 职责         | 说明                                                         |
| ------------ | ------------------------------------------------------------ |
| 面向资源     | 文件系统、artifact（jar、war、ear 文件）以及远程资源（HTTP、FTP 等） |
| API整合      | `java.lang.ClassLoader#getResource`、`java.io.File` 或`java.net.URL` |
| 资源定位     | `java.net.URL` 或`java.net.URI`                              |
| 面向流式存储 | `java.net.URLConnection`                                     |
| 协议扩展     | `java.net.URLStreamHandler` 或`java.net.URLStreamHandlerFactory` |

### Java URL 协议扩展

- 基于`java.net.URLStreamHandlerFactory`

- 基于`java.net.URLStreamHandler`

### 基于`java.net.URLStreamHandler` 扩展协议

- JDK 1.8内建协议实现

| 协议   | 实现类                                |
| ------ | ------------------------------------- |
| file   | `sun.net.www.protocol.file.Handler`   |
| ftp    | `sun.net.www.protocol.ftp.Handler`    |
| http   | `sun.net.www.protocol.http.Handler`   |
| https  | `sun.net.www.protocol.https.Handler`  |
| jar    | `sun.net.www.protocol.jar.Handler`    |
| mailto | `sun.net.www.protocol.mailto.Handler` |
| netdoc | `sun.net.www.protocol.netdoc.Handler` |

## Spring 资源接口

| 类型       | 接口                                                  |
| ---------- | ----------------------------------------------------- |
| 输入流     | `org.springframework.core.io.InputStreamSource`       |
| 只读资源   | `org.springframework.core.io.Resource`                |
| 可写资源   | `org.springframework.core.io.WritableResource`        |
| 编码资源   | `org.springframework.core.io.support.EncodedResource` |
| 上下文资源 | `org.springframework.core.io.ContextResource`         |

## Spring 内建Resource 实现

| 资源来源       | 资源协议      | 实现类                                                       |
| -------------- | ------------- | ------------------------------------------------------------ |
| Bean 定义      | 无            | `org.springframework.beans.factory.support.BeanDefinitionResource` |
| 数组           | 无            | `org.springframework.core.io.ByteArrayResource`              |
| 类路径         | classpath:/   | `org.springframework.core.io.ClassPathResource`              |
| 文件系统       | file:/        | `org.springframework.core.io.FileSystemResource`             |
| URL            | URL支持的协议 | `org.springframework.core.io.UrlResource`                    |
| ServletContext | 无            | `org.springframework.web.context.support.ServletContextResource` |

## Spring Resource 接口扩展

- 可写资源接口
  - `org.springframework.core.io.WritableResource`
  - `org.springframework.core.io.FileSystemResource`
  - `org.springframework.core.io.FileUrlResource`（@since 5.0.2）
  - `org.springframework.core.io.PathResource`（@since 4.0 & @Deprecated）
- 编码资源接口
  - `org.springframework.core.io.support.EncodedResource`

## Spring 资源加载器

- Resource 加载器
  - `org.springframework.core.io.ResourceLoader`
    - `org.springframework.core.io.DefaultResourceLoader`
    - `org.springframework.core.io.FileSystemResourceLoader`
    - `org.springframework.core.io.ClassRelativeResourceLoader`
    - `org.springframework.context.support.AbstractApplicationContext`

## Spring 通配路径资源加载器

### 通配路径ResourceLoader

- `org.springframework.core.io.support.ResourcePatternResolver`
  - `org.springframework.core.io.support.PathMatchingResourcePatternResolver`

### 路径匹配器

- `org.springframework.util.PathMatcher`
  - Ant 模式匹配实现-`org.springframework.util.AntPathMatche`

## Spring 通配路径资源扩展

- 实现`org.springframework.util.PathMatcher`
- 重置`PathMatcher`
  - `PathMatchingResourcePatternResolver#setPathMatcher`

# Spring Boot 独立应用启动

## FAT JAR和WAR执行模块-----Spring-boot-loader

- java -jar 命令引导的具体启动类必须配置在MANIFEST.MF资源的Main-Class属性中
- MANIFEST.MF资源必须存放在META-INF/ 中

```properties
Manifest-Version: 1.0
Spring-Boot-Classpath-Index: BOOT-INF/classpath.idx
Implementation-Title: spring-boot-demo
Implementation-Version: 0.0.1-SNAPSHOT
Spring-Boot-Layers-Index: BOOT-INF/layers.idx
Start-Class: com.example.springbootdemo.SpringBootDemoApplication
Spring-Boot-Classes: BOOT-INF/classes/
Spring-Boot-Lib: BOOT-INF/lib/
Build-Jdk-Spec: 1.8
Spring-Boot-Version: 2.5.2
Created-By: Maven Jar Plugin 3.2.0
Main-Class: org.springframework.boot.loader.JarLauncher
```

- MANIFEST.MF资源中的Start-Class属性被JarLauncher关联引导类。
- `org.springframework.boot.loader.jar.JarFile#registerUrlProtocolHandler`扩展URL协议

- `org.springframework.boot.loader.Launcher#getClassPathArchivesIterator`加载`BOOT-INF/lib/`中的jar包
- `org.springframework.boot.loader.MainMethodRunner#run`启动Start-Class 对应的类

# Spring Boot 生命周期

## SpringApplication初始化阶段

### SpringApplication 构造阶段

```java
	public SpringApplication(ResourceLoader resourceLoader, Class<?>... primarySources) {
		this.resourceLoader = resourceLoader;
		Assert.notNull(primarySources, "PrimarySources must not be null");
		this.primarySources = new LinkedHashSet<>(Arrays.asList(primarySources));
		this.webApplicationType = WebApplicationType.deduceFromClasspath();
		setInitializers((Collection) getSpringFactoriesInstances(ApplicationContextInitializer.class));
		setListeners((Collection) getSpringFactoriesInstances(ApplicationListener.class));
		this.mainApplicationClass = deduceMainApplicationClass();
	}
```

#### 推断Weby应用类型

采用的是检查当前ClassLoader下基准Class的存在

```java
	private static final String WEBFLUX_INDICATOR_CLASS = "org.springframework.web.reactive.DispatcherHandler";
	private static final String WEBMVC_INDICATOR_CLASS = "org.springframework.web.servlet.DispatcherServlet";
	private static final String JERSEY_INDICATOR_CLASS = "org.glassfish.jersey.servlet.ServletContainer";
	private static final String[] SERVLET_INDICATOR_CLASSES = { "javax.servlet.Servlet",
			"org.springframework.web.context.ConfigurableWebApplicationContext" };

	static WebApplicationType deduceFromClasspath() {
		if (ClassUtils.isPresent(WEBFLUX_INDICATOR_CLASS, null) && !ClassUtils.isPresent(WEBMVC_INDICATOR_CLASS, null)
				&& !ClassUtils.isPresent(JERSEY_INDICATOR_CLASS, null)) {
			return WebApplicationType.REACTIVE;
		}
		for (String className : SERVLET_INDICATOR_CLASSES) {
			if (!ClassUtils.isPresent(className, null)) {
				return WebApplicationType.NONE;
			}
		}
		return WebApplicationType.SERVLET;
	}
```

#### 加载Spring应用上下文初始化器

```java
setInitializers((Collection) getSpringFactoriesInstances(ApplicationContextInitializer.class));
```

#### 加载Spring应用事件监听器

```java
setListeners((Collection) getSpringFactoriesInstances(ApplicationListener.class));
```

#### 推断应用引导类

```java
	private Class<?> deduceMainApplicationClass() {
		try {
			StackTraceElement[] stackTrace = new RuntimeException().getStackTrace();
			for (StackTraceElement stackTraceElement : stackTrace) {
				if ("main".equals(stackTraceElement.getMethodName())) {
					return Class.forName(stackTraceElement.getClassName());
				}
			}
		}
		catch (ClassNotFoundException ex) {
			// Swallow and continue
		}
		return null;
	}
```

## SpringApplication运行阶段

### SpringApplication准备阶段

```java
	public ConfigurableApplicationContext run(String... args) {
		StopWatch stopWatch = new StopWatch();
		stopWatch.start();
		ConfigurableApplicationContext context = null;
		Collection<SpringBootExceptionReporter> exceptionReporters = new ArrayList<>();
		configureHeadlessProperty();
		SpringApplicationRunListeners listeners = getRunListeners(args);
		listeners.starting();
		try {
			ApplicationArguments applicationArguments = new DefaultApplicationArguments(args);
			ConfigurableEnvironment environment = prepareEnvironment(listeners, applicationArguments);
			configureIgnoreBeanInfo(environment);
			Banner printedBanner = printBanner(environment);
			context = createApplicationContext();
			exceptionReporters = getSpringFactoriesInstances(SpringBootExceptionReporter.class,
					new Class[] { ConfigurableApplicationContext.class }, context);
			prepareContext(context, environment, listeners, applicationArguments, printedBanner);
            refreshContext(context);
			...
		}
		return context;
	}
```

#### SpringApplicationRunListeners获取以及实例化

```java
public interface SpringApplicationRunListener {
	default void starting() {
	}
	default void environmentPrepared(ConfigurableEnvironment environment) {
	}
	default void contextPrepared(ConfigurableApplicationContext context) {
	}
	default void contextLoaded(ConfigurableApplicationContext context) {
	}
	default void started(ConfigurableApplicationContext context) {
	}
	default void running(ConfigurableApplicationContext context) {
	}
	default void failed(ConfigurableApplicationContext context, Throwable exception) {
	}
}
	// SpringApplicationRunListeners 包含了所有 SpringApplicationRunListener
	private SpringApplicationRunListeners getRunListeners(String[] args) {
		Class<?>[] types = new Class<?>[] { SpringApplication.class, String[].class };
		return new SpringApplicationRunListeners(logger,
				getSpringFactoriesInstances(SpringApplicationRunListener.class, types, this, args));
	}
```

#### 准备ConfigurableEnviroment

```java
	private ConfigurableEnvironment prepareEnvironment(SpringApplicationRunListeners listeners,
			ApplicationArguments applicationArguments) {
		// 根据 webApplicationType 创建相应的 ConfigurableEnvironment
		ConfigurableEnvironment environment = getOrCreateEnvironment();
        // 根据外部启动参数配置来设置environment
		configureEnvironment(environment, applicationArguments.getSourceArgs());
        // 固定添加 name=configurationProperties的PropertySource
		ConfigurationPropertySources.attach(environment);
        // 执行SpringApplicationRunListerner#environmentPrepared 方法回调
		listeners.environmentPrepared(environment);
		bindToSpringApplication(environment);
		if (!this.isCustomEnvironment) {
			environment = new EnvironmentConverter(getClassLoader()).convertEnvironmentIfNecessary(environment,
					deduceEnvironmentClass());
		}
		ConfigurationPropertySources.attach(environment);
		return environment;
	}
```



#### 创建Spring应用上下文（ConfigurableApplicationContext）

```java
	protected ConfigurableApplicationContext createApplicationContext() {	
		Class<?> contextClass = this.applicationContextClass;
		if (contextClass == null) {
			try {
				switch (this.webApplicationType) {
				case SERVLET:
					contextClass = Class.forName(DEFAULT_SERVLET_WEB_CONTEXT_CLASS);
					break;
				case REACTIVE:
					contextClass = Class.forName(DEFAULT_REACTIVE_WEB_CONTEXT_CLASS);
					break;
				default:
					contextClass = Class.forName(DEFAULT_CONTEXT_CLASS);
				}
			}
			catch (ClassNotFoundException ex) {
				throw new IllegalStateException(
						"Unable create a default ApplicationContext, please specify an ApplicationContextClass", ex);
			}
		}
		return (ConfigurableApplicationContext) BeanUtils.instantiateClass(contextClass);
	}
```

#### Spring应用上下文运行前准备

##### spring应用上下文准备阶段

```java
	private void prepareContext(ConfigurableApplicationContext context, ConfigurableEnvironment environment,
			SpringApplicationRunListeners listeners, ApplicationArguments applicationArguments, Banner printedBanner) {
        // 设置配置上下文
		context.setEnvironment(environment);
        // spring 应用上下文后置处理器
		postProcessApplicationContext(context);
        // 运营Spring应用上下文初始化器（ApplicationInitializer）
		applyInitializers(context);
        // 执行SpringApplicationRunListerner#contextPreapared 方法回调
		listeners.contextPrepared(context);
		...
	}
```

##### spring应用上下文装载阶段

```java
	private void prepareContext(ConfigurableApplicationContext context, ConfigurableEnvironment environment,
			SpringApplicationRunListeners listeners, ApplicationArguments applicationArguments, Banner printedBanner) {
		// Add boot specific singleton beans
    	// 注册Spring Boot Bean
		ConfigurableListableBeanFactory beanFactory = context.getBeanFactory();
		beanFactory.registerSingleton("springApplicationArguments", applicationArguments);
		if (printedBanner != null) {
			beanFactory.registerSingleton("springBootBanner", printedBanner);
		}
		if (beanFactory instanceof DefaultListableBeanFactory) {
			((DefaultListableBeanFactory) beanFactory)
					.setAllowBeanDefinitionOverriding(this.allowBeanDefinitionOverriding);
		}
		if (this.lazyInitialization) {
			context.addBeanFactoryPostProcessor(new LazyInitializationBeanFactoryPostProcessor());
		}
		// Load the sources
        // 合并应用上下文配置愿
		Set<Object> sources = getAllSources();
		Assert.notEmpty(sources, "Sources must not be empty");
        // 加载Spring应用上下文配置愿
		load(context, sources.toArray(new Object[0]));
        // 执行SpringApplicationRunListerner#contextLoaded 方法回调
		listeners.contextLoaded(context);
	}

	public Set<Object> getAllSources() {
		Set<Object> allSources = new LinkedHashSet<>();
		if (!CollectionUtils.isEmpty(this.primarySources)) {
			allSources.addAll(this.primarySources);
		}
		if (!CollectionUtils.isEmpty(this.sources)) {
			allSources.addAll(this.sources);
		}
		return Collections.unmodifiableSet(allSources);
	}
```

### Spring 应用上下文启动阶段

#### Spring IoC 容器生命周期

- 启动 `AbstractApplication#refresh`
  - 加锁
  - `preparefresh`
    - `initPropertySources`
    - `earyApplicationListeners`
  - `obtainFreshBeanFactory`
  - `prepareBeanFactory`
  - `postProcessBeanFactory`
  - `invokeBeanFactoryPostProcessors`
  - `registerBeanPostProcessors`
  - `initMessageSource`
  - `initApplicationEventMulticaster`
  - `onRefresh`
  - `registerListeners`
  - `finishBeanFactoryInitialization`
  - `finishRefresh`
  
  

### Spring应用上下文启动后阶段

```java
	public ConfigurableApplicationContext run(String... args) {
		...
		try {
			...
			afterRefresh(context, applicationArguments);
			stopWatch.stop();
			if (this.logStartupInfo) {
				new StartupInfoLogger(this.mainApplicationClass).logStarted(getApplicationLog(), stopWatch);
       		// 执行SpringApplicationRunListerner#started 方法回调
			listeners.started(context);
            // 调用ApplicationRunner 和 CommandLineRunner 
			callRunners(context, applicationArguments);
		}
		try {
			listeners.running(context);
		}
		return context;
	}
```

## SpringApplication结束阶段

`org.springframework.context.ConfigurableApplicationContext#close`

# Spring MVC

![spring mvc](https://terasolunaorg.github.io/guideline/1.0.1.RELEASE/en/_images/RequestLifecycle.png)



- 遍历HandlerMappings获取`HandlerExecutionChain` 其中包含`HandlerInterceptor[]`和`Handler`(即request 对应的Controller Method)

```java
	protected HandlerExecutionChain getHandler(HttpServletRequest request) throws Exception {
		if (this.handlerMappings != null) {
			for (HandlerMapping mapping : this.handlerMappings) {
				HandlerExecutionChain handler = mapping.getHandler(request);
				if (handler != null) {
					return handler;
				}
			}
		}
		return null;
	}
```

- 获取HandlerAdapter

```java
	protected HandlerAdapter getHandlerAdapter(Object handler) throws ServletException {
		if (this.handlerAdapters != null) {
			for (HandlerAdapter adapter : this.handlerAdapters) {
				if (adapter.supports(handler)) {
					return adapter;
				}
			}
		}
		throw new ServletException("No adapter for handler [" + handler +
				"]: The DispatcherServlet configuration needs to include a HandlerAdapter that supports this handler");
	}
```

- 拦截器进行`preHandler`

```java
	if (!mappedHandler.applyPreHandle(processedRequest, response)) {
		return;
	}

	boolean applyPreHandle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HandlerInterceptor[] interceptors = getInterceptors();
		if (!ObjectUtils.isEmpty(interceptors)) {
			for (int i = 0; i < interceptors.length; i++) {
				HandlerInterceptor interceptor = interceptors[i];
				if (!interceptor.preHandle(request, response, this.handler)) {
					triggerAfterCompletion(request, response, null);
					return false;
				}
				this.interceptorIndex = i;
			}
		}
		return true;
	}
```

- 实际调用`HandlerAdapter#handle` 以`RequestMappingHandler` 为例

  - `RequestMappingHandlerAdapter#invokeHandlerMethod`

    - 获取WebDataBinder进行设置

    ```java
        ServletWebRequest webRequest = new ServletWebRequest(request, response);
        WebDataBinderFactory binderFactory = getDataBinderFactory(handlerMethod);
        ModelFactory modelFactory = getModelFactory(handlerMethod, binderFactory);
    
        ServletInvocableHandlerMethod invocableMethod = createInvocableHandlerMethod(handlerMethod);
        if (this.argumentResolvers != null) {
            invocableMethod.setHandlerMethodArgumentResolvers(this.argumentResolvers);
        }
        if (this.returnValueHandlers != null) {
            invocableMethod.setHandlerMethodReturnValueHandlers(this.returnValueHandlers);
        }
        invocableMethod.setDataBinderFactory(binderFactory);
        invocableMethod.setParameterNameDiscoverer(this.parameterNameDiscoverer);
    ```

  - `ServletInvocableHandlerMethod#invokeAndHandle`

  ```java
  	public void invokeAndHandle(ServletWebRequest webRequest, ModelAndViewContainer mavContainer,
  			Object... providedArgs) throws Exception {
  
  		Object returnValue = invokeForRequest(webRequest, mavContainer, providedArgs);
  		setResponseStatus(webRequest);
  
  		if (returnValue == null) {
  			if (isRequestNotModified(webRequest) || getResponseStatus() != null || mavContainer.isRequestHandled()) {
  				disableContentCachingIfNecessary(webRequest);
  				mavContainer.setRequestHandled(true);
  				return;
  			}
  		}
  		else if (StringUtils.hasText(getResponseStatusReason())) {
  			mavContainer.setRequestHandled(true);
  			return;
  		}
  
  		mavContainer.setRequestHandled(false);
  		Assert.state(this.returnValueHandlers != null, "No return value handlers");
  		try {
  			this.returnValueHandlers.handleReturnValue(
  					returnValue, getReturnValueType(returnValue), mavContainer, webRequest);
  		}
  		catch (Exception ex) {
  			if (logger.isTraceEnabled()) {
  				logger.trace(formatErrorForReturnValue(returnValue), ex);
  			}
  			throw ex;
  		}
  	}
  ```

     - `InvocableHandlerMethod#invokeForRequest`
  
  ```java
  	public Object invokeForRequest(NativeWebRequest request, @Nullable ModelAndViewContainer mavContainer, Object... providedArgs) throws Exception {
          Object[] args = this.getMethodArgumentValues(request, mavContainer, providedArgs);
          if (this.logger.isTraceEnabled()) {
              this.logger.trace("Arguments: " + Arrays.toString(args));
          }
  
          return this.doInvoke(args);
      }
  ```
  
  - `InvocableHandlerMethod#getMethodArgumentValues` 参数解析
  
  ```java
  	protected Object[] getMethodArgumentValues(NativeWebRequest request, @Nullable ModelAndViewContainer mavContainer,
  			Object... providedArgs) throws Exception {
  
  		MethodParameter[] parameters = getMethodParameters();
  		if (ObjectUtils.isEmpty(parameters)) {
  			return EMPTY_ARGS;
  		}
  
  		Object[] args = new Object[parameters.length];
  		for (int i = 0; i < parameters.length; i++) {
  			MethodParameter parameter = parameters[i];
  			parameter.initParameterNameDiscovery(this.parameterNameDiscoverer);
  			args[i] = findProvidedArgument(parameter, providedArgs);
  			if (args[i] != null) {
  				continue;
  			}
  			if (!this.resolvers.supportsParameter(parameter)) {
  				throw new IllegalStateException(formatArgumentError(parameter, "No suitable resolver"));
  			}
  			try {
  				args[i] = this.resolvers.resolveArgument(parameter, mavContainer, request, this.dataBinderFactory);
  			}
  			catch (Exception ex) {
  				// Leave stack trace for later, exception may actually be resolved and handled...
  				if (logger.isDebugEnabled()) {
  					String exMsg = ex.getMessage();
  					if (exMsg != null && !exMsg.contains(parameter.getExecutable().toGenericString())) {
  						logger.debug(formatArgumentError(parameter, exMsg));
  					}
  				}
  				throw ex;
  			}
  		}
  		return args;
  	}
  ```
  
  - `InvocableHandlerMethod#doInvoke`实际调用
  - `HandlerMethodReturnValueHandlerComposite#handleReturnValue`返回值处理
  
- `HandlerExecutionChain#applyPostHandle` 拦截器后置处理

- `DispatcherServlet#processDispatchResult`处理ModuleAndView（其中包含ViewResolve的处理）

  - `DispatcherServlet#processHandlerException`
  
  ```java
  	protected ModelAndView processHandlerException(HttpServletRequest request, HttpServletResponse response,
  			@Nullable Object handler, Exception ex) throws Exception {
  
  		// Success and error responses may use different content types
  		request.removeAttribute(HandlerMapping.PRODUCIBLE_MEDIA_TYPES_ATTRIBUTE);
  
  		// Check registered HandlerExceptionResolvers...
  		ModelAndView exMv = null;
  		if (this.handlerExceptionResolvers != null) {
  			for (HandlerExceptionResolver resolver : this.handlerExceptionResolvers) {
  				exMv = resolver.resolveException(request, response, handler, ex);
  				if (exMv != null) {
  					break;
  				}
  			}
  		}
  		if (exMv != null) {
  			if (exMv.isEmpty()) {
  				request.setAttribute(EXCEPTION_ATTRIBUTE, ex);
  				return null;
  			}
  			// We might still need view name translation for a plain error model...
  			if (!exMv.hasView()) {
  				String defaultViewName = getDefaultViewName(request);
  				if (defaultViewName != null) {
  					exMv.setViewName(defaultViewName);
  				}
  			}
  			if (logger.isTraceEnabled()) {
  				logger.trace("Using resolved error view: " + exMv, ex);
  			}
  			else if (logger.isDebugEnabled()) {
  				logger.debug("Using resolved error view: " + exMv);
  			}
  			WebUtils.exposeErrorRequestAttributes(request, ex, getServletName());
  			return exMv;
  		}
  
  		throw ex;
  	}
  ```
  
  