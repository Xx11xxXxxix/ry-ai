<template>
  <div :class="classObj" class="app-wrapper" :style="{'--current-color': theme}">
    <div v-if="device==='mobile'&&sidebar.opened" class="drawer-bg" @click="handleClickOutside"/>
    <sidebar v-if="!sidebar.hide" class="sidebar-container"/>
    <div :class="{hasTagsView:needTagsView,sidebarHide:sidebar.hide}" class="main-container">
      <div :class="{'fixed-header':fixedHeader}">
        <navbar @setLayout="setLayout"/>
        <tags-view v-if="needTagsView"/>
      </div>
      <app-main/>
      <settings ref="settingRef"/>
    </div>
  </div>
</template>

<script>
import { AppMain, Navbar, Settings, Sidebar, TagsView } from './components'
import ResizeMixin from './mixin/ResizeHandler'
import { mapState } from 'vuex'
import variables from '@/assets/styles/variables.scss'

export default {
  name: 'Layout',
  components: {
    AppMain,
    Navbar,
    Settings,
    Sidebar,
    TagsView
  },
  mixins: [ResizeMixin],
  computed: {
    ...mapState({
      theme: state => state.settings.theme,
      sideTheme: state => state.settings.sideTheme,
      sidebar: state => state.app.sidebar,
      device: state => state.app.device,
      needTagsView: state => state.settings.tagsView,
      fixedHeader: state => state.settings.fixedHeader
    }),
    classObj() {
      return {
        hideSidebar: !this.sidebar.opened,
        openSidebar: this.sidebar.opened,
        withoutAnimation: this.sidebar.withoutAnimation,
        mobile: this.device === 'mobile'
      }
    },
    variables() {
      return variables
    }
  },
  methods: {
    handleClickOutside() {
      this.$store.dispatch('app/closeSideBar', { withoutAnimation: false })
    },
    setLayout() {
      this.$refs.settingRef.openSetting()
    }
  }
}
</script>

<style lang="scss" scoped>
@import "~@/assets/styles/variables.scss";

// --- 核心配色变量 (想换颜色改这里) ---
$menu-bg: #050608;             // 极深黑背景，去除土蓝感
$menu-hover-bg: rgba(0, 255, 255, 0.08); // 悬停时的淡淡光晕
$menu-text: #a0aec0;           // 普通文字颜色（高级灰）
$menu-active-text: #ffffff;    // 选中文字颜色（纯白）
$theme-color: #00ffff;         // 主题色（赛博青）

.app-wrapper {
  // 定义全局变量，方便子元素引用
  --sidebar-bg: #{$menu-bg};
}

.sidebar-container {
  transition: width 0.28s;
  width: $base-sidebar-width !important;
  background-color: $menu-bg !important;
  // 给背景加一点点噪点纹理或非常微弱的渐变，增加质感，而不是土味渐变
  background-image: radial-gradient(circle at 0% 0%, #1a1f2c 0%, $menu-bg 60%);
  height: 100%;
  position: fixed;
  font-size: 0px;
  top: 0;
  bottom: 0;
  left: 0;
  z-index: 1001;
  overflow: hidden;
  // 右侧边框改为发光线条
  border-right: 1px solid rgba(255, 255, 255, 0.05);
  box-shadow: 4px 0 20px rgba(0, 0, 0, 0.6);

  // --- 强制覆盖 Element UI 菜单样式 ---
  ::v-deep .el-menu {
    border: none;
    height: 100%;
    width: 100% !important;
    background-color: transparent !important; // 让菜单透明，透出 sidebar 的背景
  }

  // 菜单项基础样式
  ::v-deep .el-menu-item,
  ::v-deep .el-sub-menu__title {
    height: 50px !important;
    line-height: 50px !important;
    color: $menu-text !important;
    background-color: transparent !important; // 去除 Element 默认的土蓝色背景
    margin: 4px 8px; // 加上一点间距，做成悬浮感
    border-radius: 8px; // 圆角
    transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);

    // 图标样式
    .svg-icon {
      color: $menu-text;
      margin-right: 10px;
      font-size: 16px;
      vertical-align: middle;
      transition: all 0.3s;
    }

    // 文字样式
    span {
      font-weight: 500;
      letter-spacing: 0.5px;
    }

    // 悬停效果 (Hover)
    &:hover {
      background-color: $menu-hover-bg !important;
      color: $theme-color !important;

      .svg-icon {
        color: $theme-color;
        filter: drop-shadow(0 0 5px $theme-color);
        transform: scale(1.1);
      }
    }
  }

  // --- 选中状态 (Active) - 核心美化区 ---
  ::v-deep .el-menu-item.is-active {
    background: linear-gradient(90deg, rgba(0, 255, 255, 0.15) 0%, rgba(0, 255, 255, 0) 100%) !important;
    color: $menu-active-text !important;
    position: relative;
    overflow: hidden;

    // 左侧发光条
    &::before {
      content: "";
      position: absolute;
      left: 0;
      top: 10%; // 上下留一点空隙
      bottom: 10%;
      width: 3px;
      background: $theme-color;
      border-radius: 2px;
      box-shadow: 0 0 10px $theme-color;
    }

    .svg-icon {
      color: $theme-color;
      filter: drop-shadow(0 0 8px $theme-color);
    }
  }

  // --- 子菜单 (Submenu) 修复 ---
  // 彻底去除子菜单展开时的“更黑”的背景色，让它和主背景融为一体
  ::v-deep .el-sub-menu .el-menu {
    background-color: rgba(0, 0, 0, 0.2) !important; // 稍微深一点点即可，不要土蓝
  }

  // 展开箭头颜色
  ::v-deep .el-sub-menu__title i {
    color: rgba(255,255,255,0.4);
  }

  // 收起侧边栏时的样式优化
  &.el-menu--collapse {
    ::v-deep .el-sub-menu__title span,
    ::v-deep .el-menu-item span {
      height: 0;
      width: 0;
      overflow: hidden;
      visibility: hidden;
      display: inline-block;
    }
    // 修复收起时 hover 出现的弹窗背景色
    ::v-deep .el-menu--popup {
       background-color: $menu-bg !important;
       border: 1px solid rgba(255,255,255,0.1);
    }
  }
}

// 侧边栏 Logo 区域美化（如果你有这个组件的话）
::v-deep .sidebar-logo-container {
  background: transparent !important; // 透明，透出底色
  border-bottom: 1px solid rgba(255,255,255,0.05);

  .sidebar-title {
    color: #fff !important;
    font-family: 'Arial', sans-serif; // 用无衬线字体更现代
    font-weight: 600;
    background: -webkit-linear-gradient(45deg, #fff, $theme-color);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent; // 文字渐变
  }
}
</style>
