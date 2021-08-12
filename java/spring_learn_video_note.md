# 重新认识IOC

## IOC发展简介

#### 什么是IOC?

​	In [software engineering](https://en.wikipedia.org/wiki/Software_engineering), **inversion of control** (**IoC**) is a programming principle. IoC inverts the [flow of control](https://en.wikipedia.org/wiki/Control_flow) as compared to traditional control flow. In IoC, custom-written portions of a [computer program](https://en.wikipedia.org/wiki/Computer_program) receive the flow of control from a generic [framework](https://en.wikipedia.org/wiki/Software_framework). A [software architecture](https://en.wikipedia.org/wiki/Software_architecture) with this design inverts control as compared to traditional [procedural programming](https://en.wikipedia.org/wiki/Procedural_programming): in traditional programming, the custom code that expresses the purpose of the program [calls](https://en.wikipedia.org/wiki/Function_call#Main_concepts) into reusable libraries to take care of generic tasks, but with inversion of control, it is the framework that calls into the custom, or task-specific, code.

来源wikipedia https://en.wikipedia.org/wiki/Inversion_of_control

#### IOC的简史

- 1983年, Richard E. Sweet 在《The Mesa Programming Environment》中提出"Hollywood
   Principle" (好莱坞原则)
- 19884年, Ralph E. Johnson & Brian Foote 在《Designing Reusable Classes》中提出 "Inversion
  of control” (控制反转)
- 1996年, Michael Mattson《 Object-Oriented Frameworks, A survey of methodological
  issues》中将 "Inversion of control"命名为"Hollywood principle"
- 2004年, Martin Fowler 在《Inversion of Control Containers and the Dependency Injection
  pattern》中提出了自己对loC以及DI的理解
- 2005年, Martin Fowler 在《 InversionOfControl》对IOC做出进一步的说明

## IOC主要实现策略

#### [Wikipedia](https://en.wikipedia.org/wiki/Inversion_of_control)

Implementation techniques小节的定义：

In [object-oriented programming](https://en.wikipedia.org/wiki/Object-oriented_programming), there are several basic techniques to implement inversion of control. These are:

- Using a [service locator pattern](https://en.wikipedia.org/wiki/Service_locator_pattern)
- Using dependency injection, for example
  - Constructor injection
  - Parameter injection
  - Setter injection
  - Interface injection
- Using a contextualized lookup
- Using [template method design pattern](https://en.wikipedia.org/wiki/Template_method_design_pattern)
- Using [strategy design pattern](https://en.wikipedia.org/wiki/Strategy_design_pattern)

#### 《Expert One-on-One<sup>TM</sup> J2EE<sup>TM</sup> Development without EJB<sup>TM</sup>》提到的主要实现策略

loC is a broad concept that can be implemented in different ways. There are two main types:

- Dependency Lookup: The container provides callbacks to components, and a lookup context. This is
  the EJB and Apache Avalon approach. It leaves the onus on each component to use container APls to
  look up resources and collaborators. The Inversion of Control is limited to the container invoking
  callback methods that application code can use to obtain resources.
- Dependency lnjection: Components do no look up; they provide plain Java methods enabling the
  container to resolve dependencies. The container is wholly responsible for wiring up components,
  passing resolved objects in to JavaBean properties or constructors. Use of JavaBean properties is
  called Setter Injection; use of constructor arguments is called Constructor Injection.

## IOC容器的职责

#### [Wikipedia](https://en.wikipedia.org/wiki/Inversion_of_control)

在Overview小节中提到：

Inversion of control serves the following design purposes:

- To [decouple](https://en.wikipedia.org/wiki/Object_decoupling) the execution of a task from implementation.
- To focus a module on the task it is designed for.
- To free modules from assumptions about how other systems do what they do and instead rely on [contracts](https://en.wikipedia.org/wiki/Design_by_contract).
- To prevent [side effects](https://en.wikipedia.org/wiki/Side_effect_(computer_science)) when replacing a module.

Inversion of control is sometimes facetiously referred to as the "Hollywood Principle: Don't call us, we'll call you".

#### 通用职责

- 依赖处理
  - 依赖查找
  - 依赖注入
- 生命周期管理
  - 容器
  - 托管的资源(Java Beans或其他资源)
- 配置
  - 容器
  - 外部化配置
  - 托管的资源(Java Beans或其他资源)

## IOC容器的实现

#### 主要实现

- Java SE
  - Java Beans
  - Java ServiceLoader SPI
  - JNDI (Java Naming and Directory Interface)
- Java EE
  - EJB (Enterprise Java Beans)
  - Servlet
- 开源
  - [Apache Avalon](http://avalon.apache.org/closed.htmI)
  - [PicoContainer](http://picocontainer.com/)
  - [Google Guice](https://github.com/google/guice)
  - [Spring Framework](https:/ /spring.io/ projects/ spring-framework)

## 传统IOC容器实现

#### Java Beans作为IoC容器

- 特性
  - 依赖查找
  - 生命周期管理
  - 配置元信息
  - 事件
  - 自定义
  - 资源管理
  - 持久化
- 规范
  - [JavaBeans](https:/ /www.oracle.com/ technetwork/java/ javase/ tech/ index-jsp-138795.html)
  - [BeanContext](https://docs.oracle.com/javase/8/docs/technotes/guides/beans/ spec/beancontext.html)

## 轻量级IOC容器

#### 《􏰊E􏰋x􏰌p􏰍e􏰎r􏰏t 􏰐O􏰑n􏰍e􏰒-􏰄o􏰑n􏰒-􏰐O􏰑n􏰍e􏰓<sup>TM</sup> 􏰔J􏰕2􏰊E􏰊E<sup>TM</sup> 􏰖D􏰍e􏰗v􏰍e􏰘l􏰄o􏰌p􏰙m􏰍e􏰑n􏰏t 􏰚w􏰛i􏰏t􏰜h􏰄o􏰝u􏰏t 􏰊E􏰔J􏰞B􏰓<sup>TM</sup>􏰟》􏰠认􏰡为􏰀轻􏰁量􏰂级􏰇容􏰈器􏰢的􏰣特􏰤征􏰥

- A􏰧 􏰨co􏰄n􏰑t􏰏a􏰩i􏰛n􏰑􏰍e􏰎r t􏰏􏰜ha􏰩t􏰏 􏰨c􏰩an􏰑 m􏰙a􏰩n􏰑􏰩a􏰪ge􏰍 a􏰩􏰌pp􏰌􏰘l􏰛i􏰨ca􏰩􏰏ti􏰛􏰄on􏰑 􏰨co􏰄􏰫de􏰍.􏰬
- 􏰧A 􏰨co􏰄􏰑n􏰏t􏰩ai􏰛n􏰑e􏰍r􏰎 􏰏th􏰜􏰩at􏰏 􏰛is􏰭 􏰮q􏰝ui􏰛c􏰨􏰯k t􏰏o􏰄 􏰭st􏰏a􏰩r􏰎􏰏t u􏰝p􏰌.􏰬
- A􏰧 􏰨c􏰄on􏰑􏰏ta􏰩i􏰛􏰑ne􏰍􏰎r 􏰏th􏰜a􏰩t􏰏 􏰫do􏰄e􏰍􏰭s􏰑n'􏰰􏰏t r􏰎􏰍e􏰮qu􏰝i􏰛􏰎re􏰍 􏰩an􏰑􏰱y s􏰭p􏰌􏰍e􏰨ci􏰛􏰩al􏰘 􏰫de􏰍􏰌pl􏰘􏰄oy􏰱m􏰙􏰍en􏰑􏰏t s􏰭􏰏t􏰍ep􏰌s􏰭 t􏰏o􏰄 􏰫de􏰍􏰌pl􏰘􏰄o􏰱y 􏰄ob􏰲j􏰳􏰍e􏰨c􏰏t􏰭s w􏰚􏰛it􏰏h􏰜􏰛in􏰑 i􏰛t􏰏.􏰬
- 􏰧A c􏰨o􏰄n􏰑t􏰏a􏰩i􏰛􏰑ne􏰍r􏰎 t􏰏􏰜ha􏰩􏰏t 􏰜ha􏰩􏰭s 􏰭su􏰝􏰨ch􏰜 􏰩a l􏰘􏰛i􏰪g􏰜h􏰏t 􏰴fo􏰄􏰄o􏰏tp􏰌􏰎ri􏰛n􏰑􏰏t 􏰩a􏰑nd􏰫 􏰙m􏰛in􏰑i􏰛􏰙ma􏰩􏰘l 􏰧AP􏰵􏰃I d􏰫􏰍e􏰌p􏰍e􏰑nd􏰫􏰍e􏰑nc􏰨i􏰛e􏰍􏰭s 􏰏th􏰜􏰩a􏰏t 􏰛i􏰏t c􏰨a􏰩􏰑n b􏰲􏰍e r􏰎u􏰝􏰑n i􏰛􏰑n a􏰩 􏰗v􏰩a􏰎ri􏰛􏰍e􏰏ty􏰱 􏰄of􏰴 􏰍en􏰑v􏰗􏰛i􏰎r􏰄o􏰑nm􏰙e􏰍n􏰑t􏰏s􏰭.􏰬
- A􏰧 c􏰨o􏰄􏰑n􏰏t􏰩a􏰛in􏰑􏰍e􏰎r t􏰏􏰜ha􏰩t􏰏 􏰭se􏰍t􏰏s􏰭 􏰏th􏰜e􏰍 b􏰲􏰩a􏰎r 􏰴f􏰄o􏰎r a􏰩􏰫d􏰫d􏰛i􏰑n􏰪g 􏰩a 􏰙m􏰩an􏰑a􏰩􏰪ge􏰍d􏰫 􏰄o􏰲b􏰳je􏰍c􏰨t􏰏 􏰭s􏰄o 􏰘lo􏰄w􏰚 􏰛in􏰑 􏰏t􏰍e􏰎rm􏰙s􏰭 􏰄of􏰴 􏰫de􏰍p􏰌l􏰘o􏰄􏰱ym􏰙e􏰍􏰑nt􏰏 􏰍ef􏰴􏰴f􏰄o􏰎r􏰏t a􏰩􏰑n􏰫d 􏰌pe􏰍􏰎rf􏰴􏰄o􏰎rm􏰙a􏰩n􏰑􏰨c􏰍e 􏰄ov􏰗􏰍er􏰎h􏰜e􏰍a􏰩􏰫d 􏰏t􏰜ha􏰩t􏰏 i􏰛t􏰏􏰰's􏰭 􏰌p􏰄o􏰭s􏰭s􏰛ib􏰲􏰘l􏰍e 􏰏to􏰄 d􏰫􏰍e􏰌pl􏰘􏰄oy􏰱 a􏰩􏰑nd􏰫 m􏰙a􏰩n􏰑􏰩a􏰪g􏰍e f􏰴􏰛i􏰑ne􏰍-􏰒􏰪g􏰎r􏰩ai􏰛n􏰑e􏰍d􏰫 o􏰄􏰲b􏰳j􏰍ec􏰨t􏰏􏰭s,􏰶 a􏰩􏰭s w􏰚e􏰍􏰘ll􏰘 􏰩a􏰭s c􏰨􏰄o􏰩ar􏰎s􏰭e􏰍􏰒-􏰪g􏰎r􏰩ai􏰛􏰑ne􏰍􏰫d 􏰨co􏰄􏰙mp􏰌􏰄o􏰑ne􏰍n􏰑t􏰏s􏰭􏰬.􏰷”

􏰸来自􏰹􏰦“􏰅C􏰜h􏰩a􏰌p􏰏t􏰍er􏰎 􏰺6􏰬. L􏰻􏰛i􏰪g􏰜ht􏰏w􏰚􏰍e􏰛ig􏰪h􏰜t􏰏 􏰅C􏰄on􏰑t􏰏a􏰩􏰛in􏰑e􏰍r􏰎s􏰭 a􏰩􏰑nd􏰫 I􏰃n􏰑􏰗ve􏰍r􏰎s􏰭i􏰛􏰄o􏰑n o􏰄f􏰴 􏰅C􏰄o􏰑n􏰏tr􏰎o􏰄l􏰘”􏰷 节􏰼选􏰽

#### 《Expert One-on-One<sup>TM</sup> J2EE<sup>TM</sup> Development without EJB<sup>TM</sup>》认为轻量级容器的好处

- Escaping the monolithic container
- Maximizing code reusability
- Greater object orientation
- Greater productivity
- Better testability

## 依赖查找 VS 依赖注入

#### 优劣对比

| 类型     | 依赖处理 | 实现便利性 | 代码侵入性   | API依赖性     | 可读性 |
| -------- | -------- | ---------- | ------------ | ------------- | ------ |
| 依赖查找 | 主动获取 | 相对繁琐   | 侵入业务逻辑 | 依赖容器API   | 良好   |
| 依赖注入 | 被动提供 | 相对边里   | 低侵入性     | 不依赖容器API | 一般   |



## 构造器注入 VS Setter注入

#### Spring Framework 对构造器注入与 Setter 的论点:

 The Spring team generally **advocates constructor injection**, as it lets you implement application components as immutable objects and ensures that required dependencies are not null. Furthermore, constructor-injected components are always returned to the client (calling) code in a fully initialized state. As a side note, a large number of constructor arguments is a bad code smell, implying that the class likely has too many responsibilities and should be refactored to better address proper separation of concerns.

**Setter injection should primarily only be used for optional dependencies** that can be assigned reasonable default values within the class. Otherwise, not-null checks must be performed everywhere the code uses the dependency. One benefit of setter injection is that setter methods make objects of that class amenable to reconfiguration or re-injection later. Management through JMX MBeans is therefore a compelling use case for setter injection.

来自“Constructor-based or setter-based DI” 节选

#### 《Expert One-on-One<sup>TM</sup> J2EE<sup>TM</sup> Development without EJB<sup>TM</sup>》认为 Setter 注入的优点: “Advantages of Setter Injection include:

- JavaBean properties are well supported in IDEs.
- JavaBean properties are self-documenting.
- JavaBean properties are inherited by subclasses without the need for any code.
- It's possible to use the standard JavaBeans property-editor machinery for type conversions if necessary.
- Many existing JavaBeans can be used within a JavaBean-oriented IoC container without modification.
- If there is a corresponding getter for each setter (making the property readable, as well as writable), it is possible to ask the component for its current configuration state. This is particularly useful if we want to persist that state: for example,in an XML form or in a database. With Constructor Injection, there's no way to find the current state.
- Setter Injection works well for objects that have default values, meaning that not all properties need to be supplied at runtime.”

来自“Chapter 6. Lightweight Containers and Inversion of Control” 节选

#### 《Expert One-on-One<sup>TM</sup> J2EE<sup>TM</sup> Development without EJB<sup>TM</sup>》认为 Setter 注入的缺点: “Disadvantages include:

 The order in which setters are called is not expressed in any contract. Thus, we sometimes need to invoke a method after the last setter has been called to initialize the component. Spring provides the org.springframework.beans.factory.InitializingBean interface for this; it also provides the ability to invoke an arbitrary init method. However, this contract must be documented to ensure correct use outside a container.

Not all the necessary setters may have been called before use. The object can thus be left partially configured.”

来自“Chapter 6. Lightweight Containers and Inversion of Control” 节选

#### 《Expert One-on-One<sup>TM</sup> J2EE<sup>TM</sup> Development without EJB<sup>TM</sup>》认为构造器注入的优点: “Advantages of Constructor Injection include:

 Each managed object is guaranteed to be in a consistent state—fully configured—before it can be invoked in any business methods. This is the primary motivation of Constructor Injection. (However, it is possible to achieve the same result with JavaBeans via dependency checking, as Spring can optionally perform.) There's no need for initialization methods.

There may be slightly less code than results from the use of multiple JavaBean methods, although will be no difference in complexity.”

#### 《Expert One-on-One<sup>TM</sup> J2EE<sup>TM</sup> Development without EJB<sup>TM</sup>》认为构造器注入的缺点:

“Disadvantages include:

- Although also a Java-language feature, multi-argument constructors are probably less common in existing code than use of JavaBean properties.

- Java constructor arguments don't have names visible by introspection.

- Constructor argument lists are less well supported by IDEs than JavaBean setter methods.

- Long constructor argument lists and large constructor bodies can become unwieldy.

- Concrete inheritance can become problematic.

- Poor support for optional properties, compared to JavaBeans

- Unit testing can be slightly more difficult

- When collaborators are passed in on object construction, it becomes impossible to change the reference held in the

  object. ”

来自“Chapter 6. Lightweight Containers and Inversion of Control” 节选

# Spring IOC容器概述

## Spring IoC 依赖查找

- 根据 Bean 名称查找 
  -  实时查找
  -  延迟查找
- 根据 Bean 类型查找
  - 单个 Bean 对象
  - 集合 Bean 对象

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

## Spring IoC 配置元信息

- Bean 定义配置 
  - 基于 XML 文件
  - 基于 Properties 文件
  - 基于 Java 注解
  - 基于 Java API(专题讨论)

- IoC 容器配置
  - 基于 XML 文件
  - 基于 Java 注解
  - 基于 Java API (专题讨论) 
- 外部化属性配置
  -  基于 Java 注解

## Spring IoC 容器

- BeanFactory 和 ApplicationContext 谁才是 Spring IoC 容器?
  - BeanFactory 和 ApplicationContext 都是spring IOC 容器，ApplicationContext是BeanFactory的子接口，提供更多企业级的功能。

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

## 使用 Spring IoC 容器

- BeanFactory 是 Spring 底层 IoC 容器
- ApplicationContext 是具备应用特性的 BeanFactory 超集

## Spring IoC 容器生命周期

- 启动
- 运行
- 停止

# Spring Bean 基础

## 定义 Spring Bean

#### 什么是 BeanDefinition?

- BeanDefinition 是 Spring Framework 中定义 Bean 的配置元信息接口，包含:
  - Bean 的类名
  - Bean 行为配置元素，如作用域、自动绑定的模式，生命周期回调等
  - 其他 Bean 引用，又可称作合作者(collaborators)或者依赖(dependencies)
  - 配置设置，比如 Bean 属性(Properties)

## BeanDefinition 元信息

#### BeanDefinition 元信息

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
- 通过 AbstractBeanDefinition 以及派生类

## 命名 Spring Bean

- Bean 的名称 

  - 每个 Bean 拥有一个或多个标识符(identifiers)，这些标识符在 Bean 所在的容器必须是唯一 的。通常，一个 Bean 仅有一个标识符，如果需要额外的，可考虑使用别名(Alias)来扩充。
  - 在基于 XML 的配置元信息中，开发人员可用 id 或者 name 属性来规定 Bean 的 标识符。通常 Bean 的 标识符由字母组成，允许出现特殊字符。如果要想引入 Bean 的别名的话，可在 name 属性使用半角逗号(“,”)或分号(“;”) 来间隔。
  - Bean 的 id 或 name 属性并非必须制定，如果留空的话，容器会为 Bean 自动生成一个唯一的 名称。Bean 的命名尽管没有限制，不过官方建议采用驼峰的方式，更符合 Java 的命名约定。

- Bean 名称生成器(BeanNameGenerator)

- 由 Spring Framework 2.0.3 引入，框架內建两种实现:

  DefaultBeanNameGenerator:默认通用 BeanNameGenerator 实现

- AnnotationBeanNameGenerator:基于注解扫描的 BeanNameGenerator 实现，起始于

  Spring Framework 2.5，关联的官方文档:
   With component scanning in the classpath, Spring generates bean names for unnamed components, following the rules described earlier: essentially, taking the simple class name and turning its initial character to lower-case. However, in the (unusual) special case when there is more than one character and both the first and second characters are upper case, the original casing gets preserved. These are the same rules as defined by java.beans.Introspector.decapitalize (which Spring uses here).

## Spring Bean 的别名

- Bean 别名(Alias)的价值
  -  复用现有的 BeanDefinition
  -  更具有场景化的命名方法，比如:
```<alias name="myApp-dataSource" alias="subsystemA-dataSource"/>```
``` <alias name="myApp-dataSource" alias="subsystemB-dataSource"/>```

## 注册 Spring Bean

- BeanDefinition 注册
  - XML 配置元信息
    -  <bean name=”...” ... />
  -  Java 注解配置元信息
    - @Bean
    - @Component
    - @Import
  - Java API 配置元信息
    - 命名方式:`BeanDefinitionRegistry#registerBeanDefinition(String,BeanDefinition)`
    - 非命名方式:`BeanDefinitionReaderUtils#registerWithGeneratedName(AbstractBeanDefinition,BeanDefinitionRegistry)`
  - 配置类方式:`AnnotatedBeanDefinitionReader#register(Class...)`
-  外部单例对象注册
  -  Java API 配置元信息
    - `SingletonBeanRegistry#registerSingleton`

## 实例化 Spring Bean

- Bean 实例化(Instantiation)
  - 常规方式
    - 通过构造器(配置元信息:XML、Java 注解和 Java API )
    - 通过静态工厂方法(配置元信息:XML 和 Java API )
    - 通过 Bean 工厂方法(配置元信息:XML和 Java API )
    - 通过 FactoryBean(配置元信息:XML、Java 注解和 Java API )
  - 特殊方式
    - 通过 ServiceLoaderFactoryBean(配置元信息:XML、Java 注解和 Java API )
    - 通过 AutowireCapableBeanFactory#createBean(java.lang.Class, int, boolean)
    - 通过 BeanDefinitionRegistry#registerBeanDefinition(String,BeanDefinition)

## 初始化 Spring Bean

- Bean 初始化(Initialization)
  - @PostConstruct 标注方法 (1)
  - 实现 InitializingBean 接口的 afterPropertiesSet() 方法 (2)
  - 自定义初始化方法 (3)
    - XML 配置:<bean init-method=”init” ... />
    - Java 注解:@Bean(initMethod=”init”)
    - Java API:AbstractBeanDefinition#setInitMethodName(String)

## 延迟初始化 Spring Bean

- Bean 延迟初始化(Lazy Initialization) 
  - XML 配置:<bean lazy-init=”true” ... />
  -  Java 注解:@Lazy(true)

## 销毁 Spring Bean

- Bean 销毁(Destroy)
  - @PreDestroy 标注方法(1)
  - 实现 DisposableBean 接口的 destroy() 方法(2)
  - 自定义销毁方法(3)
    - XML 配置:<bean destroy=”destroy” ... />
    - Java 注解:@Bean(destroy=”destroy”)
    - Java API:AbstractBeanDefinition#setDestroyMethodName(String)

## 垃圾回收 Spring Bean

- Bean 垃圾回收(GC)

   1. 关闭 Spring 容器(应用上下文)
   2. 执行GC
   3. Spring Bean 覆盖的 finalize() 方法被回调