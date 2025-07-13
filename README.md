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

## QT_QPA_PLATFORM Implementation
```
#include <unistd.h>

template <typename T>
T* rgbaxy_pixel_data_ptr(QImage& img, int x, int y) {
    if(Q_UNLIKELY(!img.valid(x, y))) return nullptr;
    return reinterpret_cast<T*>(
        img.scanLine(y) + x * sizeof(void*)
        );
}

    QPaintEngine *createImagePaintEngine(QPaintDevice *paintDevice) const override {
        QImage mImage;
        if (void *data = nullptr; !posix_memalign(&data, sysconf(_SC_PAGESIZE), sysconf(_SC_PAGESIZE)))
            mImage = QImage(static_cast<uchar *>(data),
                                   sysconf(_SC_LEVEL1_DCACHE_LINESIZE)/sizeof(void*),
                                   sysconf(_SC_PAGESIZE)/sysconf(_SC_LEVEL1_DCACHE_LINESIZE),
                                   sysconf(_SC_LEVEL1_DCACHE_LINESIZE),
                                   sizeof(quint64) == sizeof(void*) ?
                                       QImage::Format_RGBA64 : QImage::Format_ARGB32,
                                   std::free,
                                   data);
        qDebug() << "Page is aligned:" << (( reinterpret_cast<uintptr_t>(mImage.constBits()) %
                                                sysconf(_SC_PAGESIZE) == 0) ? "Yes" : "No");
        qDebug() << "mImage &data is" << reinterpret_cast<uintptr_t>(mImage.constBits());
        int i {0};
        qDebug() << "Address of i is" << reinterpret_cast<uintptr_t>(&i);
        for (int y = 0; y < mImage.height(); y++) {
            for(int x = 0; x < mImage.width(); x++) {
                //*(reinterpret_cast<int **>(mImage.scanLine(y)) + x) = &i;
                if(auto* ptr = rgbaxy_pixel_data_ptr<int *>(mImage, x, y)) {
                    //*ptr = &i;
                    *ptr = nullptr;
                }
                if (!(x + y))
                *rgbaxy_pixel_data_ptr<int *>(mImage, 0, 0) = &i;
                //*(reinterpret_cast<int **>(mImage.scanLine(0)) + 0) = &i;
                qDebug() << "Address(" << i++ << ")"
                         << reinterpret_cast<uintptr_t>(rgbaxy_pixel_data_ptr<int *>(mImage, x, y))
                         << "is <"
                         << (*rgbaxy_pixel_data_ptr<int *>(mImage, x, y) == nullptr ? "nullptr >" : "not nullptr >")
                         << "and content is"
                         << reinterpret_cast<uintptr_t>(*rgbaxy_pixel_data_ptr<int *>(mImage, x, y));
            }
        }

        qDebug() << "Creating a QMasterBoostEngine in QWebIntegration";
        return new QMasterBoostEngine(paintDevice);
    };
```

## Prepare Source Code
```
sudo apt autopurge
sudo apt autoclean
sudo apt update

apt source libqt6gui6

sed -i 's/AUTODETECT OFF/AUTODETECT ON/g' qt6-base-6.8.2+dfsg/src/plugins/sqldrivers/configure.cmake
find qt6-base-6.8.2+dfsg -type f -exec sed -i 's/cmake_minimum_required(VERSION 3.../cmake_minimum_required(VERSION 3.28/g' {} \;
find qt6-base-6.8.2+dfsg -type f -exec sed -i 's/cmake_minimum_required(VERSION 3......3...)/cmake_minimum_required(VERSION 3.28...3.31)/g' {} \;
sed -i 's/\(Using system provided SQLite\) ......... no/\1 ......... yes/g' qt6-base-6.8.2+dfsg/src/sql/doc/snippets/code/doc_src_sql-driver.qdoc

mkdir qt6-base-6.8.2+dfsg/src/wui
git clone git@github.com:siyan4/qt6wui.git qt6-base-6.8.2+dfsg/src/wui
env QT_DEBUG_PLUGINS=1 QT_STYLE_DEBUG=1 QT_QPA_PLATFORM=web QT_QPA_PLATFORMTHEME=gtk3 QT_STYLE_OVERRIDE=fusion ./build/Desktop-Debug/untitled
env QT_DEBUG_PLUGINS=1 QT_STYLE_DEBUG=1 QT_QPA_PLATFORM=WEB QT_QPA_PLATFORMTHEME=gtk3 QT_STYLE_OVERRIDE=kvantum ./build/Desktop-Debug/untitled
env QT_DEBUG_PLUGINS=1 QT_STYLE_DEBUG=1 QT_QPA_PLATFORM=WEB QT_QPA_PLATFORMTHEME=wtk4 QT_STYLE_OVERRIDE=bootstrap5 ./build/Desktop-Debug/untitled
env QT_DEBUG_PLUGINS=1 QT_STYLE_DEBUG=1 QT_QPA_PLATFORM=WEB QT_QPA_PLATFORMTHEME=angular QT_STYLE_OVERRIDE=bootstrap5 ./build/Desktop-Debug/untitled
```
