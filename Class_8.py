# # OOP三大特征：封装，继承，多态
#
# # 类的继承
# # 父类的调用
# # 静态方法、
#
#
#
# '''
# 当一个对象被删除或者销毁时，python解释器会默认调用一个方法__del__()
#
# '''
#
#
# class Animal():
#     def __new__(cls, *args, **kwargs):
#         print("开始析构")
#         return object.__new__(cls)
#     def __init__(self, name):
#         self.name = name
#         print("析构初始化方法")
#
#     def __del__(self):
#         #主要的作用是来销毁对象
#         print("析构销毁，%s对象被销毁了"%self.name)
#
#
# cat = Animal("狸花猫")
# # del cat 手动清理删除
#
# print(cat.name)
# # 开始析构
# # 析构初始化方法
# # 狸花猫
# # 析构销毁，狸花猫对象被销毁了

