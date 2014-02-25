(function () {

  function World () {
    this.scene = new THREE.Scene;
    this.scene.add(new Pyramid);

    this.renderer = new THREE.WebGLRenderer({ alpha: true });

    this.aspect = this.aspect.bind(this);
    this.aspect();
    window.addEventListener('resize', this.aspect);

    this.place();

    this.render = this.render.bind(this);
    this.render();
  }

  World.prototype.place = function place () {
    document.body.appendChild(this.renderer.domElement);
  };

  World.prototype.render = function render () {
    requestAnimationFrame(this.render);
    this.renderer.render(this.scene, this.camera);
  };

  World.prototype.aspect = function () {
    this.camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
    this.camera.position.z = 10;
    this.camera.position.y = 1;

    this.renderer.setSize(window.innerWidth, window.innerHeight);
  };

  function Pyramid () {
    return new THREE.Mesh(this.geometry, this.material);
  }

  Pyramid.prototype.geometry = new THREE.CylinderGeometry(0, 1.5, 2, 4, false);
  Pyramid.prototype.material = new THREE.MeshBasicMaterial({ wireframe: true, color: 0xffffff });

  new World;

})();
