# qt6wui
The Qt-based libraries for developing applications of Web User Interface.

## Class Analogy
|                                 qt6gui                                |                                 qt6wui                                |
|:---------------------------------------------------------------------:|:---------------------------------------------------------------------:|
|                      class Q_GUI_EXPORT QPainter;                     |                      class Q_WUI_EXPORT QBooster;                     |
|                    class Q_GUI_EXPORT QPaintDevice;                   |                    class Q_WUI_EXPORT QBoostDevice;                   |
| class Q_WIDGETS_EXPORT QWidget : public QObject, public QPaintDevice; | class Q_WEBGETS_EXPORT QWebget : public QObject, public QBoostDevice; |
|                      class Q_GUI_EXPORT QSurface;                     |             class Q_WUI_EXPORT QWebsite : public QSurface;            |
|     class Q_GUI_EXPORT QWindow : public QObject, public QSurface;     |     class Q_WUI_EXPORT QWebdoc : public QObject, public QWebsite;     |
|          class Q_WIDGETS_EXPORT QMainWindow : public QWidget;         |          class Q_WEBGETS_EXPORT QMainWebdoc : public QWebget;         |
|                                                                       |                                                                       |

## Include Analogy
|                           qt6gui                          |                              qt6wui                             |
|:---------------------------------------------------------:|:---------------------------------------------------------------:|
|     /usr/include/x86_64-linux-gnu/qt6/QtGui/qpainter.h    |     /usr/local/include/x86_64-linux-gnu/qt6/QtWui/qbooster.h    |
|   /usr/include/x86_64-linux-gnu/qt6/QtGui/qpaintdevice.h  |   /usr/local/include/x86_64-linux-gnu/qt6/QtWui/qboostdevice.h  |
|   /usr/include/x86_64-linux-gnu/qt6/QtWidgets/qwidget.h   |   /usr/local/include/x86_64-linux-gnu/qt6/QtWebgets/qwebget.h   |
|     /usr/include/x86_64-linux-gnu/qt6/QtGui/qsurface.h    |     /usr/local/include/x86_64-linux-gnu/qt6/QtWui/qwebsite.h    |
|     /usr/include/x86_64-linux-gnu/qt6/QtGui/qwindow.h     |     /usr/local/include/x86_64-linux-gnu/qt6/QtWui/qwebdoc.h     |
| /usr/include/x86_64-linux-gnu/qt6/QtWidgets/qmainwindow.h | /usr/local/include/x86_64-linux-gnu/qt6/QtWebgets/qmainwebdoc.h |
|                                                           |                                                                 |

## Library Analogy
|                      qt6gui                      |                         qt6wui                         |
|:------------------------------------------------:|:------------------------------------------------------:|
|   /usr/lib/x86_64-linux-gnu/libQt6Gui.so.6.8.2   |   /usr/local/lib/x86_64-linux-gnu/libQt6Wui.so.6.8.2   |
| /usr/lib/x86_64-linux-gnu/libQt6Widgets.so.6.8.2 | /usr/local/lib/x86_64-linux-gnu/libQt6Webgets.so.6.8.2 |
|                                                  |                                                        |
