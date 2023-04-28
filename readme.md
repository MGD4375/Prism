# Prism

This is a fictional project called Prism, which has two web services. 
- Cerulean.Web
- Vermillion.Web

The goal was to use Azure Front Door to combine access to both. For example, if we give our front door the domain: prism.com

https://prism.com/cerulean -> Cerulean.Web

https://prism.com/vermillion -> Vermillion.Web

This can potentially enable us to migrate from cerulean to vermillion over time, replacing one route at a time where we want a like-for-like replacement, and adding new ones where we don't.